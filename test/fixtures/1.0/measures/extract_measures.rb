require 'fileutils'

unless ARGV.length > 0
  puts "Usage: extract_measures path_to_measure_bundle"
  exit(1)
end

hqmf_r1_files = File.join(ARGV[0].chomp, "sources", "e{h,p}", "*", "hqmf1.xml")
Dir.glob(hqmf_r1_files) do | f |
  match_data = /.*(ep|eh)[\/\\](.*)[\/\\]hqmf1.xml/.match(f)
  new_file = File.join(File.dirname(__FILE__), "#{match_data[1]}_#{match_data[2]}.xml")
  FileUtils.cp(f, new_file)
end