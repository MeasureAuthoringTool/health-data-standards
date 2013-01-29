require 'test_helper'

class PatientImporterTest < MiniTest::Unit::TestCase
  def test_ecog_status_importing
    patient = build_record_from_xml('test/fixtures/cat1_fragments/ecog_fragment.xml')
    ecog_status = patient.conditions.first
    assert ecog_status.codes['SNOMED-CT'].include?('423237006')
  end

  def test_discharge_medication_importing
    patient = build_record_from_xml('test/fixtures/cat1_fragments/discharge_medication_fragment.xml')
    discharge = patient.medications.first
    assert discharge.codes['RxNorm'].include?('994435')
  end

  def test_physical_exam_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/physical_exam_performed_fragment.xml')
    physical_exam = patient.procedures.first
    assert physical_exam.codes['LOINC'].include?('8462-4')
  end

  def test_procedure_intolerance
    patient = build_record_from_xml('test/fixtures/cat1_fragments/procedure_intolerance_fragment.xml')
    procedure_intolerance = patient.allergies.first
    assert procedure_intolerance.codes['CPT'].include?('90668')
  end

  def test_procedure_order
    patient = build_record_from_xml('test/fixtures/cat1_fragments/procedure_order_fragment.xml')
    procedure_order = patient.procedures.first
    assert procedure_order.codes['CPT'].include?('90870')
  end

  private

  def build_record_from_xml(xml_file)
    doc = Nokogiri::XML(File.new(xml_file))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    
    patient = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient, doc)
    patient
  end

end