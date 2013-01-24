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
    discharge.codes['RxNorm'].include?('994435')
  end

  # Mike's code --------
  def test_physical_exam_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/physical_exam_performed_fragment.xml')
    physical_exam = patient.procedures.first #mike note: procedure class in model shows all specific params (derived from entry class which has all general ones)
    physical_exam.codes
  end

  # Mike's code end -------

  private

  def build_record_from_xml(xml_file)
    doc = Nokogiri::XML(File.new(xml_file))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    
    patient = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient, doc)
    patient
  end

end