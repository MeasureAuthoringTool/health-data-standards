require 'test_helper'

class MedicationImporterTest < MiniTest::Unit::TestCase
  def test_medication_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)
    
    medication = patient.medications[0]
    assert medication.codes['RxNorm'].include? '307782'
    assert_equal 6, medication.administration_timing['period']['value']
    assert_equal 'IPINHL', medication.route['code']
    assert_equal 2, medication.dose['value']
    assert_equal '127945006', medication.site['code']
    assert_equal 'SNOMED-CT', medication.site['codeSystem']
    assert_equal 5, medication.dose_restriction['numerator']['value']
    assert_equal 10, medication.dose_restriction['denominator']['value']
    assert_equal '415215001', medication.product_form['code']
    assert_equal '334980009', medication.delivery_method['code']
    assert_equal '73639000', medication.type_of_medication['code']
    assert_equal 'DrugVehicleCode', medication.vehicle['code']
    assert_equal 'eleventeen', medication.fulfillment_history[0].prescription_number
    assert_equal 'Pseudo', medication.fulfillment_history[0].provider.given_name
    assert_equal '100 Bureau Drive', medication.fulfillment_history[0].provider.addresses[0].street[0]
    assert_equal 1316476800, medication.fulfillment_history[0].dispense_date
    assert_equal 30, medication.fulfillment_history[0].quantity_dispensed['value']
    assert_equal 4, medication.fulfillment_history[0].fill_number

    medication = patient.medications[3]
    assert_equal 'VA/KPproblemList', medication.indication['code']
    assert_equal 1, medication.order_information.size
    assert_equal 1, medication.order_information.first.fills
    assert_equal 1, medication.order_information.first.quantity_ordered['value']
    assert_equal 'tablet', medication.order_information.first.quantity_ordered['unit']

  end
end