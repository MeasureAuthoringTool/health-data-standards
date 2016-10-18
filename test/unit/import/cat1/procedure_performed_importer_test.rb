require 'test_helper'

class ProcedurePerformedImporterTest < Minitest::Test
  def test_procedure_performed
   	doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/procedure_performed_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    p_p= HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::ProcedurePerformedImporter.new, '2.16.840.1.113883.3.560.1.6', 'ordered')
    procedures_performed = p_p.package_entries(cat1_patient_data_section(doc), nrh)
    procedure_performed = procedures_performed[0]
    assert procedure_performed.codes['SNOMED-CT'].include?('236211007')
    assert procedure_performed.ordinality['SNOMED-CT'].include?('63161005')
    assert procedure_performed.oid
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19860117151405')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19860118051933')
    assert_equal expected_start, procedure_performed.start_time
    assert_equal HealthDataStandards::Util::HL7Helper.timestamp_to_integer("19860117151505"), procedure_performed.incision_time
    assert_equal true, procedure_performed.negation_ind
  end

  def test_procedure_performed_r31_ordinality
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/procedure_performed_fragment_r31.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    p_p= HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::ProcedurePerformedImporter.new, '2.16.840.1.113883.3.560.1.6', 'ordered')
    procedures_performed = p_p.package_entries(cat1_patient_data_section(doc), nrh)
    procedure_performed = procedures_performed[0]
    assert procedure_performed.ordinality['SNOMED-CT'].include?('63161005')
  end
end