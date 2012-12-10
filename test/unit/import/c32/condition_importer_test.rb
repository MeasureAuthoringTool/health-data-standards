require 'test_helper'

class ConditionImporterTest < MiniTest::Unit::TestCase
  def test_condition_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)

    condition = patient.conditions[0]

    assert_equal 'Condition', condition.type
    assert ! condition.cause_of_death
    assert condition.codes['SNOMED-CT'].include? '195967001'
    assert_equal Time.gm(1950).to_i, condition.start_time
    assert_equal 1, condition.priority
    assert condition.ordinality.include?('SNOMED-CT')
    assert condition.ordinality['SNOMED-CT'].include?('8319008')
  end
end