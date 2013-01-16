require 'test_helper'

class GestationalAgeImporterTest < MiniTest::Unit::TestCase
  def test_gestational_age_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/gestational_age_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    gai = HealthDataStandards::Import::Cat1::GestationalAgeImporter.new
    entries = gai.create_entries(doc)
    
    ga = entries[0]
    assert ga.codes['SNOMED-CT'].include?("931004")
  end
end