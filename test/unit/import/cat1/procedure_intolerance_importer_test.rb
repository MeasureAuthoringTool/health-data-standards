require 'test_helper'

class ProcedureIntoleranceImporterTest < MiniTest::Unit::TestCase
  def test_procedure_intolerance
   	doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/procedure_intolerance_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    p_i = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::ProcedureIntoleranceImporter.new, '2.16.840.1.113883.3.560.1.61')
    procedure_intolerances = p_i.package_entries(doc, nrh)
    procedure_intolerance = procedure_intolerances[0]
    assert procedure_intolerance.codes['CPT'].include?('90668')
  end
end