require 'json'
require 'erb'

fixtures_dir = ENV['FIXTURE_DIR'] || File.join('fixtures', 'measures')
output_dir = ENV['HTML_OUTPUT_DIR'] || File.join('tmp', 'html')

def epoch_pp(seconds_since_epoch)
  if seconds_since_epoch.kind_of? Fixnum
    Time.at(seconds_since_epoch).utc.strftime('%B %d, %Y')
  else
    seconds_since_epoch
  end
end

def extract_dates(thingy, dates)
  if thingy.kind_of? Fixnum
    dates[thingy] = epoch_pp(thingy)
  elsif thingy.kind_of? Array
    thingy.each {|inner_thingy| extract_dates(inner_thingy, dates)}
  elsif thingy.kind_of? Hash
    thingy.values.each {|inner_thingy| extract_dates(inner_thingy, dates)}
  else
    # Must be a string
  end
end

namespace :fixtures do
  
  # NOTE: This will create invalid JSON fixture files, since JSON does not have the ability add comments.
  #       However, most JSON parsers handle this just fine.
  desc 'Place a comment header at the top of each fixture file with a table of seconds since epoch to month, day, year'
  task :time_comments do
    Dir.glob(File.join(fixtures_dir,'*','patients','*.json')) do |file|
      fixture_person = JSON.parse(File.read(file))
      dates = {}
      extract_dates(fixture_person, dates)
      
      fixture = File.open(file, 'w')
      fixture.write("//\n// Dates used in this fixture\n//\n")
      dates.each_pair do |key, value|
        fixture.write("// #{key} - #{value}\n")
      end
      fixture.write(JSON.pretty_generate(fixture_person))
      fixture.close
    end
  end
  
  desc 'Generate HTML versions of the patient fixtures'
  task :html_doc do
    patient_template = File.read(File.join(File.dirname(__FILE__), 'patient_fixture.erb'))
    patient_erb = ERB.new(patient_template)
    
    result_template = File.read(File.join(File.dirname(__FILE__), 'result.erb'))
    result_erb = ERB.new(result_template)
    
    fixtures_path = Pathname.new(fixtures_dir)
    output_path = Pathname.new(output_dir)
    
    Dir.glob(File.join(fixtures_dir,'*','patients','*.json')) do |file|
      @patient = JSON.parse(File.read(file))
      @filename = file
      html = patient_erb.result(binding)
      
      fixture_path = Pathname.new(file)
      relative_fixture_path = fixture_path.relative_path_from(fixtures_path)
      measure_output_path = output_path + relative_fixture_path
      FileUtils.mkdir_p(measure_output_path.dirname)
      File.open(measure_output_path.sub_ext('.html'), 'w') do |html_out|
        html_out.write(html)
      end
    end
    
    Dir.glob(File.join(fixtures_dir,'*','result.json')) do |file|
      result_json = JSON.parse(File.read(file))
      if result_json["results"]
        @results = result_json["results"]
      else
        @results = [result_json]
      end
      html = result_erb.result(binding)
      
      result_path = Pathname.new(file)
      relative_result_path = result_path.relative_path_from(fixtures_path)
      result_output_path = output_path + relative_result_path
      
      File.open(result_output_path.sub_ext('.html'), 'w') do |html_out|
        html_out.write(html)
      end
    end
  end
end