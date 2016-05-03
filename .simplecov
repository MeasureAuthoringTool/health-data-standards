SimpleCov.command_name 'Unit Tests'
SimpleCov.start do
  add_filter "test/"
  add_filter "templates/"
  add_group "Import", "lib/health-data-standards/import"
  add_group "Export", "lib/health-data-standards/export"
  add_group "Models", "lib/health-data-standards/models"
  add_group "Utilities", "lib/health-data-standards/util"
  add_group "Validate", "lib/health-data-standards/validate"
  add_group "HQMF R2", "lib/hqmf-parser/2.0"
end

class SimpleCov::Formatter::QualityFormatter
  def format(result)
    SimpleCov::Formatter::HTMLFormatter.new.format(result)
    File.open("coverage/covered_percent", "w") do |f|
      f.puts result.source_files.covered_percent.to_f
    end
  end
end

SimpleCov.formatter = SimpleCov::Formatter::QualityFormatter