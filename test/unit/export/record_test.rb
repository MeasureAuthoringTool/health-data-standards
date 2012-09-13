require 'test_helper'
require 'pry'
require "fileutils"

module GreenC32
  class RecordTest < MiniTest::Unit::TestCase

    def setup
      
    end
    
    def test_export
      # Dir.new("c32").each do |c32|
      # 	if c32.ends_with?("xml")
      #     doc = Nokogiri::XML(File.open("c32/#{c32}"))
      #     doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      # 	  record = HealthDataStandards::Import::C32::PatientImporter.instance.parse_c32(doc)
      # 	  binding.pry
      #     green = HealthDataStandards::Export::GreenC32::Record.export(record)
      #     FileUtils.touch("greenc32/#{c32}")
      #     File.open("greenc32/#{c32}", "w") { |f| f.write(green) }
      # 	end
      # end
      # HealthDataStandards::Export::GreenC32::Record.export(@record)
    end
  end
end