namespace :value_set do

  desc 'Parse a value set to JSON'
  task :parse, [:path] do |t, args|
    
    raise "You must specify the value set xls file path to parse" unless args.path

    FileUtils.mkdir_p File.join(".","tmp",'json','value_sets')
    path = File.expand_path(args.path)

    parser = HQMF::ValueSet::Parser.new
    parsed = parser.parse path
    
    file = File.expand_path(path)
    filename = Pathname.new(file).basename
    
    outfile = File.join(".","tmp",'json', 'value_sets', "#{filename}.json")
    File.open(outfile, 'w') {|f| f.write(parsed.to_json) }
    puts "wrote result to: #{outfile}"
    
  end
  
end
