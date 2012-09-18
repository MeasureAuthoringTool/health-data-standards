require 'test_helper'
require 'pry'
require "fileutils"

module GreenC32
  class RecordTest < MiniTest::Unit::TestCase

    def setup
      
    end
    
    def test_export
      # folder = "c32"
      # Dir.new(folder).each do |c32|
      #   if c32.ends_with?("xml")
      #     doc = Nokogiri::XML(File.open("#{folder}/#{c32}"))
      #     doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      #     record = HealthDataStandards::Import::C32::PatientImporter.instance.parse_c32(doc)
      #     # binding.pry
      #     green = HealthDataStandards::Export::GreenC32::Record.export(record)
      #     output = "exports/#{c32}"
      #     FileUtils.touch(output)
      #     File.open(output, "w") { |f| f.write(green) }
      #   end
      # end
      # HealthDataStandards::Export::GreenC32::Record.export(@record)
    end
  end
end