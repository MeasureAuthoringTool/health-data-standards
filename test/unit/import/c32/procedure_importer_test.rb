require 'test_helper'

class ProcedureImporterTest < Minitest::Test

  def setup
    collection_fixtures('providers', '_id')
  end

  def test_procedure_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)
    procedure = patient.procedures[0]
    assert !procedure.negation_ind
    assert procedure.codes['SNOMED-CT'].include? '52734007'
    assert_equal "Dr.", procedure.performer.title
    assert_equal 'Kildare', procedure.performer.family_name
    assert_equal procedure.site['code'], "1234567"
    assert_equal procedure.site['codeSystem'], "SNOMED-CT"
    procedure = patient.procedures[1]
    assert procedure.negation_ind
    assert_equal 'PATOBJ', procedure.negation_reason['code']
    assert procedure.codes['SNOMED-CT'].include? '52734007'
    assert_equal procedure.performer.title, "Dr."
    assert_equal 'Watson', procedure.performer.family_name
    assert_equal procedure.site['code'], "1234567"
    assert_equal procedure.site['codeSystem'], "SNOMED-CT"
  end
end
