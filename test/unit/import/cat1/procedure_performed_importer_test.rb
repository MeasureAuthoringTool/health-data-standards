require 'test_helper'

class ProcedurePerformedImporterTest < MiniTest::Unit::TestCase
  def test_procedure_performed
   	doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/procedure_performed_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    p_p= HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::ProcedurePerformedImporter.new, '2.16.840.1.113883.3.560.1.6', 'ordered')
    procedures_performed = p_p.package_entries(doc, nrh)
    procedure_performed = procedures_performed[0]
    assert procedure_performed.codes['SNOMED-CT'].include?('236211007')
    assert procedure_performed.ordinality['SNOMED-CT'].include?('63161005')
    assert procedure_performed.oid
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19860117151405')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19860118051933')
    assert_equal expected_start, procedure_performed.start_time
  end
end