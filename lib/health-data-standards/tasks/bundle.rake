require 'health-data-standards'
require 'highline/import'
require 'open-uri'

db_name = ENV['DB_NAME'] || 'test'

namespace :bundle do

  desc 'Activate/Inactivate a measure bundle'
  task :activate,[:version,:active] => [:environment] do |task, args|
    bundle = HealthDataStandards::CQM::Bundle.where({version: args.version})
    if bundle.count == 0
      puts "Cannot find bundle with version number #{args.version}"
      return
    end

    bundle.each do |b|
      b.active = (args.active == "true")
      b.save
      puts "Bundle #{b.title} - #{b.version}  active: #{b.active}"
    end

  end

  desc %{ Download measure/test deck bundle.
    options
    nlm_user    - the nlm username to authenticate to the server - will prompt is not supplied
    nlm_passwd  - the nlm password for authenticating to the server - will prompt if not supplied
    version     - the version of the bundle to download - this must be supplied

   example usage:
    rake bundle:download nlm_name=username nlm_passwd=password version=2.1.0-latest
  }
  task :download => :environment do
    bundle_version = ENV.fetch("version") do
      raise ArgumentError.new("Required argument 'version' was not supplied")
    end
    nlm_user = ENV["nlm_user"]
    nlm_passwd = ENV["nlm_pass"]
    measures_dir = File.join(Dir.pwd, "bundles")

    while nlm_user.nil? || nlm_user == ""
      nlm_user = ask("NLM Username?: "){ |q| q.readline = true }
    end

    while nlm_passwd.nil? || nlm_passwd == ""
      nlm_passwd = ask("NLM Password?: "){ |q| q.echo = false
					       q.readline = true }
    end

    @bundle_name = "bundle-#{bundle_version}.zip"

    puts "Downloading and saving #{@bundle_name} to #{measures_dir}"
    # Pull down the list of bundles and download the version we're looking for
    bundle_uri = "https://cypressdemo.healthit.gov/measure_bundles/#{@bundle_name}"
    bundle = nil

    tries = 0
    max_tries = 10
    last_error = nil
    while bundle.nil? && tries < max_tries do
      tries = tries + 1
      begin
	bundle = open(bundle_uri, :proxy => ENV["http_proxy"],:http_basic_authentication=>[nlm_user, nlm_passwd] )
      rescue OpenURI::HTTPError => oe
	last_error = oe
	if oe.message == "401 Unauthorized"
	  puts "Please check your credentials and try again"
	  break
	end
      rescue => e
	last_error = e
	sleep 0.5
      end
    end

    if bundle.nil?
       puts "An error occured while downloading the bundle"
      raise last_error if last_error
    end
    # Save the bundle to the measures directory
    FileUtils.mkdir_p measures_dir
    FileUtils.mv(bundle.path, File.join(measures_dir, @bundle_name))

  end

  desc %{ Download and install the measure/test deck bundle.  This is essientally delegating to the bundle_download and bundle:import tasks
    options
    nlm_user    - the nlm username to authenticate to the server - will prompt is not supplied
    nlm_passwd  - the nlm password for authenticating to the server - will prompt if not supplied
    version     - the version of the bundle to download. This will default to the version
    delete_existing - delete any existing bundles with the same version and reinstall - default is false - will cause error if same version already exists
    update_measures - update any existing measures with the same hqmf_id to those contained in this bundle.
		      Will only work for bundle versions greater than that of the installed version - default is false
    type -  type of measures to be installed from bundle. A bundle may have measures of different types such as ep or eh.  This will constrain the types installed, defautl is all types
   example usage:
    rake budnle:download_and_install nlm_name=username nlm_passwd=password version=2.1.0-latest  type=ep
  }
  task :download_and_install => [:download] do
    de = ENV['delete_existing'] || false
    um = ENV['update_measures'] || false
    puts "Importing bundle #{@bundle_name} delete_existing: #{de}  update_measures: #{um} type: #{ENV['type'] || 'ALL'}"
    task("bundle:import").invoke("bundles/#{@bundle_name}",de, um , ENV['type'], 'true')
  end



  desc 'List bundles'
  task :list  => [:environment] do
     HealthDataStandards::CQM::Bundle.where({}).each do |b|
      puts "Bundle #{b.title} - #{b.version}  active: #{b.active}"
     end
  end


  desc 'Import a quality bundle into the database.'
  task :import, [:bundle_path,  :delete_existing,  :update_measures, :type, :create_indexes, :exclude_results] => :environment do |task, args|
    raise "The path to the measures zip file must be specified" unless args.bundle_path
    options = {:delete_existing => (args.delete_existing == "true"),
    					 :type => args.type,
    					 :update_measures => (args.update_measures == "true"),
               :exclude_results => (args.exclude_results == "true")
    					}

    bundle = File.open(args.bundle_path)
    importer = HealthDataStandards::Import::Bundle::Importer
    bundle_contents = importer.import(bundle, options)

    counts = {measures: bundle_contents.measures.count,
              records: bundle_contents.records.count,
              extensions: bundle_contents[:extensions].count,
              value_sets: bundle_contents.value_sets.count}

    if (args.create_indexes != 'false')
      ::Rails.application.eager_load! if defined? Rails
      ::Mongoid::Tasks::Database.create_indexes
    end

    puts "Successfully imported bundle at: #{args.bundle_path}"
    puts "\t Imported into environment: #{Rails.env.upcase}" if defined? Rails
    puts "\t Loaded #{args.type || 'all'} measures"
    puts "\t Sub-Measures Loaded: #{counts[:measures]}"
    puts "\t Test Patients Loaded: #{counts[:records]}"
    puts "\t Extensions Loaded: #{counts[:extensions]}"
    puts "\t Value Sets Loaded: #{counts[:value_sets]}"


  end

  # this task is most likely temporary.  Once Bonnie can handle both EP and EH measures together, this would no longer be required.
  desc 'Merge two bundles into one.'
  task :merge, [:bundle_one,:bundle_two] do |t, args|
    raise "Two bundle zip file paths to be merged must be specified" unless args.bundle_one && args.bundle_two

    tmpdir = Dir.mktmpdir
    ['measures','patients','library_functions','results', 'sources', 'value_sets'].each do |dir|

      FileUtils.mkdir_p(File.join(tmpdir, 'output', dir))

    end

    begin

      ({'one'=>args.bundle_one,'two'=>args.bundle_two}).each do |key, source|
        Zip::ZipFile.open(source) do |zip_file|
          zip_file.each do |f|
            f_path=File.join(tmpdir, key, f.name)
            FileUtils.mkdir_p(File.dirname(f_path))
            zip_file.extract(f, f_path) unless File.exist?(f_path)
          end
        end
      end


      ['measures','patients','library_functions', 'sources'].each do |dir|
        ['one','two'].each do |key|
          FileUtils.mv(Dir.glob(File.join(tmpdir,key,dir,'*')), File.join(tmpdir,'output',dir))
        end
      end

      ['value_sets'].each do |dir|
        FileUtils.mkdir_p(File.join(tmpdir,'output',dir,'json'))
        FileUtils.mkdir_p(File.join(tmpdir,'output',dir,'xml'))
        ['one','two'].each do |key|
          ['json', 'xml'].each do |type|
            FileUtils.mv(Dir.glob(File.join(tmpdir,key,dir,type,'*')), File.join(tmpdir,'output',dir,type))
          end
        end
      end

      Dir.glob(File.join(tmpdir,'one','results','*.json')).each do |result_path_one|
        json_one = JSON.parse(File.new(result_path_one).read)
        result_filename = Pathname.new(result_path_one).basename.to_s
        json_two = JSON.parse(File.new(File.join(tmpdir,'two','results',result_filename)).read)
        File.open(File.join(tmpdir,'output','results',result_filename), 'w') {|f| f.write(JSON.pretty_generate(json_one + json_two)) }
      end

      json_one = JSON.parse(File.new(File.join(tmpdir,'one','bundle.json')).read)
      json_two = JSON.parse(File.new(File.join(tmpdir,'two','bundle.json')).read)
      json_out = {}

      json_out.merge! json_one

      ['measures','patients','extensions'].each do |key|
        json_out[key] = (json_one[key] + json_two[key]).uniq
      end

      version = json_out['version']

      File.open(File.join(tmpdir,'output','bundle.json'), 'w') {|f| f.write(JSON.pretty_generate(json_out)) }
      date_string = Time.now.strftime("%Y-%m-%d")

      out_zip = File.join('tmp','bundles',"bundle-merged-#{date_string}-#{version}.zip")
      FileUtils.remove_entry_secure out_zip if File.exists?(out_zip)
      Zip::ZipFile.open(out_zip, 'w') do |zipfile|
        path = File.join(tmpdir,'output')
        Dir[File.join(path,'**','**')].each do |file|
          zipfile.add(file.sub(path+'/',''),file)
        end
      end

      puts "wrote merged bundle to: #{out_zip}"

    ensure
      FileUtils.remove_entry_secure tmpdir
    end


  end

end
