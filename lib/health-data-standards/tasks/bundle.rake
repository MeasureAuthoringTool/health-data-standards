require 'health-data-standards'

db_name = ENV['DB_NAME'] || 'test'

namespace :bundle do
  desc 'Import a quality bundle into the database.'
  task :import, [:bundle_path,  :delete_existing,  :update_measures, :type] => [:environment] do |task, args|
    raise "The path to the measures zip file must be specified" unless args.bundle_path
    options = {:clear_db => (args.delete_existing == "true"),
    					 :type => args.type ,
    					 :update_measures => (args.update_measures == "true")
    					}

    bundle = File.open(args.bundle_path)    
    importer = HealthDataStandards::Import::Bundle::Importer
    bundle_contents = importer.import(bundle, options)
    
    puts "Successfully imported bundle at: #{args.bundle_path}"
    puts "\t Imported into environment: #{Rails.env.upcase}" if defined? Rails 
    puts "\t Loaded #{args.type || 'all'} measures"
    puts "\t Measures Loaded: #{bundle_contents.measures.count}"
    puts "\t Test Patients Loaded: #{bundle_contents.records.count}"
    puts "\t Extensions Loaded: #{bundle_contents[:extensions].count}"
  end
  
  # this task is most likely temporary.  Once Bonnie can handle both EP and EH measures together, this would no longer be required.
  desc 'Merge two bundles into one.'
  task :merge, [:bundle_one,:bundle_two] do |t, args|
    raise "Two bundle zip file paths to be merged must be specified" unless args.bundle_one && args.bundle_two
    
    tmpdir = Dir.mktmpdir
    ['measures','patients','library_functions','results', 'sources'].each do |dir|
      
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
      
      Dir.glob(File.join(tmpdir,'one','results','*.json')).each do |result_path_one|
        json_one = JSON.parse(File.new(result_path_one).read)
        result_filename = Pathname.new(result_path_one).basename.to_s
        json_two = JSON.parse(File.new(File.join(tmpdir,'two','results',result_filename)).read)
        File.open(File.join(tmpdir,'output','results',result_filename), 'w') {|f| f.write(JSON.pretty_generate(json_one + json_two)) }
      end
      
      json_one = JSON.parse(File.new(File.join(tmpdir,'one','bundle.json')).read)
      json_two = JSON.parse(File.new(File.join(tmpdir,'two','bundle.json')).read)
      json_out = {}

      ['title','effective_date','version','license','exported'].each do |key|
        json_out[key] = json_one[key]
      end

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
