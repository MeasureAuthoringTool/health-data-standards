require 'test_helper'

class CCRTest < MiniTest::Unit::TestCase
  def test_ccr
    collection_fixtures('records', '_id')
    record = Record.find('4dcbecdb431a5f5878000004')

    doc = Nokogiri::XML(HealthDataStandards::Export::CCR.export(record))

    doc.root.add_namespace_definition('ccr', 'urn:astm-org:CCR')
    # registration information

    assert_equal 'Rosa', doc.at_xpath('//ccr:Actors/ccr:Actor/ccr:Person/ccr:Name/ccr:CurrentName/ccr:Given').text
    assert_equal 'Vasquez', doc.at_xpath('//ccr:Actors/ccr:Actor/ccr:Person/ccr:Name/ccr:CurrentName/ccr:Family').text
    assert_equal 'Female', doc.at_xpath('//ccr:Actors/ccr:Actor/ccr:Person/ccr:Gender/ccr:Text').text
    assert_equal '1980-12-11T23:50:14Z', doc.at_xpath('//ccr:Actors/ccr:Actor/ccr:Person/ccr:DateOfBirth/ccr:ExactDateTime').text

    # problems
    assert_equal '160603005', doc.at_xpath('//ccr:Problems/ccr:Problem/ccr:Description/ccr:Code/ccr:Value').text
    # vital sign
    assert_equal '225171007', doc.at_xpath('//ccr:VitalSigns/ccr:Result/ccr:Test/ccr:Description/ccr:Code/ccr:Value').text
    # lab results
    assert_equal '439958008', doc.at_xpath('//ccr:Results/ccr:Result/ccr:Test/ccr:Description/ccr:Code/ccr:Value').text
    # procedure
    assert_equal '171055003', doc.at_xpath('//ccr:Procedures/ccr:Procedure/ccr:Description/ccr:Code/ccr:Value').text
    # encounter
    assert_equal '99201', doc.at_xpath('//ccr:Encounters/ccr:Encounter/ccr:Description/ccr:Code/ccr:Value').text
    # allergy
    assert_equal '70618', doc.at_xpath('//ccr:Alerts/ccr:Alert/ccr:Description/ccr:Code/ccr:Value').text
    # medication
    assert_equal '105075', doc.at_xpath('//ccr:Medications/ccr:Medication/ccr:Product/ccr:BrandName/ccr:Code/ccr:Value').text
    # immunization
    assert_equal '854931', doc.at_xpath('//ccr:Immunizations/ccr:Immunization/ccr:Product/ccr:BrandName/ccr:Code/ccr:Value').text
    #race

    assert_equal '2110-5', doc.at_xpath('//ccr:SocialHistory/ccr:SocialHistoryElement[./ccr:Type/ccr:Text = "Race"]/ccr:Description/ccr:Code[./ccr:CodingSystem = "2.16.840.1.113883.6.238"]/ccr:Value').text
    #ethnicity
    assert_equal '2135-2', doc.at_xpath('//ccr:SocialHistory/ccr:SocialHistoryElement[./ccr:Type/ccr:Text = "Ethnicity"]/ccr:Description/ccr:Code[./ccr:CodingSystem = "2.16.840.1.113883.6.238"]/ccr:Value').text
      
      
  end
  
  
  def test_schema_validation
    #this will only run if there is an environment variable set to point to the 
    #schema location.  Cant be pushing the schema to github ya know . 
    
   if ENV['CCR_SCHEMA']
   collection_fixtures('records', '_id')
    Record.all.each do |record|
      doc = Nokogiri::XML(HealthDataStandards::Export::CCR.export(record))
      
      xsd = Nokogiri::XML::Schema(open(ENV['CCR_SCHEMA']))
      assert_equal [], xsd.validate(doc) 
    end  
   else
     warn "warning: CCR schema validation not taking place.  Set CCR_SCHEMA environment variable to location of CCR schema for this to take place"
   end

  end
end