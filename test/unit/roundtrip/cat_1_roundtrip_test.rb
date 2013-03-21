require 'test_helper'

class Cat1RoundtripTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::Helper::Cat1ViewHelper



#   FORGET BARRY BERRY
# Work on creating a record from scratch in the test class

# Record.new



# Add in the necessary info : name, etc.

# Add in one encounter and see if I can get in thru the exporter

# Then work from there to get importers involved

  

  #export cat 1 - from Cat1Test

  def test_round_trip
    @barry = Record.where({first: "Barry"}).first #TODO: compare this record to the one I'm creating from scratch below to get syntax correct
    @brandy = Record.with(database: "cypress_development").where({first: "Brandy"}).first
    @maxine = Record.with(database: "cypress_development").where({first: "Maxine"}).first
    @dorothy = Record.with(database: "cypress_development").where({first: "Dorothy"}).first

    #$BREAK = true
    #@patient = Record.new
    #@patient.encounters << Encounter.new({codes: {:CPT => ["99201"]}, description: "Outpatient encounter", time: 1268042997, mood_code: "EVN", reason: {"codes"=>{"CPT"=>["99201"]}, "description"=>"PCP referred"}, admitType: {"code"=>"04", "codeSystem"=>"regular"}, dischargeDisp: "Home", low: 1124956803, hi: 1314259203})
    #@patient.encounters << Encounter.new({root: '2.16.840.1.113883.10.20.24.3.23', codes: {:SNOMED => ["112689000"]}, description: "Encounter, Performed: Hospital Measures-Encounter Inpatient (Code List: 2.16.840.1.113883.3.666.5.625)", status: "completed", mood_code: "EVN", start_time: 20061121075239, end_time: 20061122012933})
    
    @patient = @maxine
    #@patient = @dorothy
    # @patient.encounters << Encounter.new({oid: '2.16.840.1.113883.3.560.1.79', codes: {"CPT"=>["99201"]}})
    # @patient.first = "He"
    # @patient.last = "Man"
    # @patient.birthdate = -223262033
    # #@patient.name = "He Man"
    # @patient.gender = "M"
    # @patient.entries_for_oid('2.16.840.1.113883.3.560.1.79')

    @start_date = Time.now.years_ago(1)
    @end_date = Time.now

    #@measures_tmp = MEASURES.first
    #@measures = [@measures_tmp]
    @measures = MEASURES
    #binding.pry
    @qrda_xml = HealthDataStandards::Export::Cat1.new.export(@patient, @measures, @start_date, @end_date)

    @doc = Nokogiri::XML(@qrda_xml)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')

    File.open('maxine-nqf0002-NEW-fixture.xml', 'w') { |file| file.write(@doc) }
    #File.open('dorothy-nqf0002.xml', 'w') { |file| file.write(@doc) }

#Need to identify which measures I want to test for in the export statement (looks like constant MEASURES has them all - it is huge)
#TODO - medication makes it thorugh becaues it has an OID (hqmf) and the code is in the correct valueset - if OID isn't present or if code(snowmed, loinc, etc) isn't from the appropriate valueset then the entry will not be exported
#TODO-NEXT need to go through the entries in the record object and compare content from exported record to imported record using assertion statements
#DOn't compare on the record level because the order of elements could screw it up as well as the fact that they will probably have different mongoid IDs

  end






  #import cat 1 - from PatientImporterTest

  # def test_care_goal
  #   patient = build_record_from_xml('test/fixtures/cat1_fragments/care_goal_fragment.xml')
  #   care_goal = patient.care_goals.first
  #   assert care_goal.codes['SNOMED-CT'].include?('252465000')
  #   assert care_goal.oid
  #   expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('201101011400')
  #   assert_equal expected_start, care_goal.start_time
  # end

  # def build_record_from_xml(xml_file)
  #   doc = Nokogiri::XML(File.new(xml_file))
  #   doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
  #   doc.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
  #   patient = Record.new
  #   HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient, doc)
  #   patient
  # end
end