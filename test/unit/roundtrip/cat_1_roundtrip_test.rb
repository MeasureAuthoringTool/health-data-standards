require 'test_helper'

class Cat1RoundtripTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  # def initialize
    # exporter = HealthDataStandards::Test::Unit::Export::Cat1Test.new
    # importer = HealthDataStandards::Test::Unit::Import::Cat1::PatientImporterTest.new
  # end
  



  
  #TODO: where does exporter dump the xml? need to have importer pick it up automatically




  #export cat 1 - from Cat1Test

  def setup
    @patient = Record.where({first: "Barry"}).first

    @start_date = Time.now.years_ago(1)
    @end_date = Time.now

    @measures = MEASURES
    @qrda_xml = HealthDataStandards::Export::Cat1.new.export(@patient, @measures, @start_date, @end_date)
    @doc = Nokogiri::XML(@qrda_xml)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
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