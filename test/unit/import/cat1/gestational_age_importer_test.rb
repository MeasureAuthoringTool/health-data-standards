require 'test_helper'

class GestationalAgeImporterTest < MiniTest::Unit::TestCase
  def test_gestational_age_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/gestational_age_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    gai = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::GestationalAgeImporter.new, '2.16.840.1.113883.3.560.1.1001')
		gais = gai.package_entries(doc, nrh)
		gestational_age = gais[0]
		assert gestational_age.codes['SNOMED-CT'].include?("931004")
  end
end