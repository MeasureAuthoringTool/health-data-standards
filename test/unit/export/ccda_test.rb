require 'test_helper'

class CCDATest < MiniTest::Unit::TestCase
  
  def setup
    collection_fixtures('records', '_id')
    @pi = HealthDataStandards::Import::CCDA::PatientImporter.instance
    @record = Record.find('4dcbecdb431a5f5878000004')
    ccda = HealthDataStandards::Export::CCDA.new.export(@record)
    @doc = Nokogiri::XML(ccda)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    @patient = @pi.parse_ccda(@doc)
  end
  
  def test_demographics
    assert_equal 'Rosa', @patient.first
    assert_equal 'Vasquez', @patient.last
    assert_equal 'F', @patient.gender
    assert_equal 345426614, @patient.birthdate
  end
  
  def test_encounters
    encounter = @patient.encounters[0]
    assert_equal 1267322332, encounter.time
    assert_equal({"CPT" => ["99201"]}, encounter.codes)
  end
  
  def test_allergies
    allergy = @patient.allergies[0]
    assert_equal 1271810257, allergy.as_point_in_time
    assert_equal({"RxNorm" => ["70618"]}, allergy.codes)
  end
  
  def test_conditions
    condition = @patient.conditions[0]
    assert_equal 1269776601, condition.as_point_in_time
    assert_equal({"SNOMED-CT" => ["160603005"]}, condition.codes)
  end
  
  def test_vitals
    vital = @patient.vital_signs[0]
    assert_equal 1266664414, vital.time
    assert_equal({"SNOMED-CT" => ["225171007"]}, vital.codes)
    assert_equal "26", vital.values[0][:scalar]

    vital = @patient.vital_signs[1]
    assert_equal "true", vital.values[0][:scalar]

    vital = @patient.vital_signs[2]
    assert_equal "testing", vital.values[0][:scalar] 
    # Make sure that the paths to string, physical quantity, and boolean type values is valid
    assert_equal 1, @doc.xpath("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.27']/cda:value[. = 'testing' and @xsi:type = 'ST']").length
    assert_equal 1, @doc.xpath("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.27']/cda:value[@value = '26'  and @xsi:type = 'PQ']").length
    assert_equal 1, @doc.xpath("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.27']/cda:value[@value = 'true'  and @xsi:type = 'BL']").length

  end
  
  def test_procedures
    procedure = @patient.procedures[0]
    assert_equal 1273150428, procedure.time
    assert_equal({"SNOMED-CT" => ["171055003"]}, procedure.codes)
  end

  def test_results
    result = @patient.results[0]
    assert_equal 1257901150, result.time
    assert_equal({"SNOMED-CT" => ["439958008"]}, result.codes)
  end

  def test_immunizations
    immunization = @patient.immunizations[0]
    assert_equal 1264529050, immunization.time
    assert_equal({"RxNorm" => ["854931"]}, immunization.codes)
  end

  def test_medications
    medication = @patient.medications[0]
    assert_equal 1271810257, medication.start_time
    assert_equal({"RxNorm" => ["105075"]}, medication.codes)
  end

  def test_care_goals
    assert !@patient.care_goals.nil?
  end

  def test_social_history
    social_history = @patient.social_history[0]
    assert_equal 1265778000, social_history.time
    assert_equal({"ICD-9-CM" => ["250"]}, social_history.codes)
  end
  
  def test_medical_equipment
    medical_equipment = @patient.medical_equipment[0]
    assert_equal 1279252800, medical_equipment.time
    assert_equal({"SNOMED-CT" => ["56961003"]}, medical_equipment.codes)
  end
end
