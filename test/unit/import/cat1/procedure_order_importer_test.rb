require 'test_helper'

class ProcedureOrderImporterTest < MiniTest::Unit::TestCase
  def test_procedure_order
   	doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/procedure_order_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    p_o = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::ProcedureOrderImporter.new, '2.16.840.1.113883.3.560.1.62', 'ordered')
    procedure_orders = p_o.package_entries(doc, nrh)
    procedure_order = procedure_orders[0]
    assert procedure_order.codes['CPT'].include?('90870')
    assert procedure_order.oid
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20110524094323')
    assert_equal expected_start, procedure_order.start_time
  end
end