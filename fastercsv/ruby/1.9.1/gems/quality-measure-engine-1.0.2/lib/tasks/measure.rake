path = File.dirname(__FILE__)
path = path.index('lib') == 0 ? "./#{path}" : path
require 'json'
require 'zlib'
gem 'rubyzip'
require 'zip/zip'
require 'zip/zipfilesystem'
require File.join(path,'../quality-measure-engine')

measures_dir = ENV['MEASURE_DIR'] || 'measures'
bundle_dir = ENV['BUNDLE_DIR'] || './'
xls_dir = ENV['XLS_DIR'] || 'xls'
db_name = ENV['DB_NAME'] || 'test'

namespace :measures do
  
  desc 'Build all measures to tmp directory'
  task :build do
    puts "Loading measures from #{measures_dir}"
    dest_dir = File.join('.', 'tmp')
    Dir.mkdir(dest_dir) if !Dir.exist?(dest_dir)
    Dir.glob(File.join(measures_dir, '*')).each do |measure_dir|
      measures = QME::Measure::Loader.load_measure(measure_dir)
      measures.each do |measure|
        id = measure['id']
        sub_id = measure['sub_id']
        json = JSON.pretty_generate(measure)
        file_name = File.join(dest_dir, "#{id}#{sub_id}.json")
        file = File.new(file_name,  "w")
        file.write(json)
        file.close
      end
    end
  end
  
  desc "run the map_test tool"
  task :map_tool do
    puts "Loading measures from #{measures_dir}"
    require File.join(path,"../../map_test/map_test.rb")
  end
  
  desc 'Take a snapshot of the current measures, system.js and bundles collections and store as a ZIP file'
  task :snapshot do
    tmp = File.join('.', 'tmp')
    dest_dir = File.join(tmp, 'bundle')
    FileUtils.rm_r dest_dir, :force=>true
    FileUtils.mkdir_p(dest_dir)
    system("mongodump --db #{db_name} --collection bundles --out - > #{dest_dir}/bundles.bson")
    system("mongodump --db #{db_name} --collection system.js --out - > #{dest_dir}/system.js.bson")
    system("mongodump --db #{db_name} --collection measures --out - > #{dest_dir}/measures.bson")
    read_me = <<EOF
Load the included files into Mongo as follows:

mongorestore --db dbname --drop measures.bson
mongorestore --db dbname --drop bundles.bson
mongorestore --db dbname --drop system.js.bson

Where dbname is the name of the database you want to load the measures into. For a
production system this will typically be pophealth-production. For a development
system it will typically be pophealth-development.

Note that the existing contents of the destination database's measures, system.js and
bundles collections will be lost.
EOF
    File.open(File.join(dest_dir, 'README.txt'), 'w') {|f| f.write(read_me) }
    
    archive = File.join(tmp, 'bundle.zip')
    puts "Snapshot saved to #{archive}"
    FileUtils.rm archive, :force=>true
    
    Zip::ZipFile.open(archive, 'w') do |zipfile|
      Dir["#{dest_dir}/*"].each do |file|
        zipfile.add(File.basename(file),file)
      end
    end    
    FileUtils.rm_r dest_dir, :force=>true
  end
  
  desc "convert NQF Excel spreadsheets to JSON"
  task :convert do
    require LIB + '/qme/measure/properties_builder'
    require LIB + '/qme/measure/properties_converter'
    dest_dir = File.join('.', 'tmp')    
    Dir.mkdir(dest_dir) if !Dir.exist?(dest_dir)
    Dir.glob(File.join(xls_dir, '*.xlsx')).each do |measure|
      properties = QME::Measure::Converter.from_xls(measure)
      json = JSON.pretty_generate(properties)
      file_name = File.join(dest_dir, "#{File.basename(measure)}.json")
      file = File.new(file_name,  "w")
      file.write(json)
      file.close
    end
  end

end
