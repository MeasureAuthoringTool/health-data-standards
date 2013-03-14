require 'test_helper'

class Cat1RoundtripTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  # def initialize
    # exporter = HealthDataStandards::Test::Unit::Export::Cat1Test.new
    # importer = HealthDataStandards::Test::Unit::Import::Cat1::PatientImporterTest.new
  # end
  



  #export cat 1 - from Cat1Test

  def setup
    @patient = Record.where({first: "Barry"}).first

    @start_date = Time.now.years_ago(1)
    @end_date = Time.now

    @measures = MEASURES
    @qrda_xml = HealthDataStandards::Export::Cat1.new.export(@patient, @measures, @start_date, @end_date)
    @doc = Nokogiri::XML(@qrda_xml)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')

    File.open('temp.xml', 'w') { |file| file.write(@doc) }
#Need to identify which measures I want to test for in the export statement (looks like constant MEASURES has them all - it is huge)
#TODO - medication makes it thorugh becaues it has an OID (hqmf) and the code is in the correct valueset - if OID isn't present or if code(snowmed, loinc, etc) isn't from the appropriate valueset then the entry will not be exported
#TODO-NEXT need to go through the entries in the record object and compare content from exported record to imported record using assertion statements
#DOn't compare on the record level because the order of elements could screw it up as well as the fact that they will probably have different mongoid IDs

  end






  #import cat 1 - from PatientImporterTest

  def test_care_goal
    patient = build_record_from_xml('test/fixtures/cat1_fragments/care_goal_fragment.xml')
    care_goal = patient.care_goals.first
    assert care_goal.codes['SNOMED-CT'].include?('252465000')
    assert care_goal.oid
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('201101011400')
    assert_equal expected_start, care_goal.start_time
  end

  def build_record_from_xml(xml_file)
    doc = Nokogiri::XML(File.new(xml_file))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    doc.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    patient = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient, doc)
    patient
  end
end