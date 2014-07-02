
require 'test_helper'

class EncounterImporterTest < Minitest::Test
  
  def setup
    collection_fixtures('providers', '_id')
  end

  def test_encounter_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)

    encounter = patient.encounters[0]
    assert encounter.codes['CPT'].include? '99241'
    assert_equal encounter.performer.title, "Dr."
    assert_equal 'Kildare', encounter.performer.family_name
    assert_equal encounter.facility.name, 'Good Health Clinic'
    assert encounter.reason.codes['SNOMED-CT'].include? '308292007'
    assert_equal encounter.admit_type['code'], 'xyzzy'
    assert_equal encounter.admit_type['codeSystem'], 'CPT'
    assert_equal 'HL7 Healthcare Service Location', encounter.facility.code['codeSystem']
    assert_equal Time.gm(2000, 4, 7).to_i, encounter.facility.start_time
    assert_equal '1117-1', encounter.facility.code['code']
  end
end
