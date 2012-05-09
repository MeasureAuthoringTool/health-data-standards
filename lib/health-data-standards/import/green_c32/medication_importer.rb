module HealthDataStandards
  module Import
    module GreenC32
      class MedicationImporter < SectionImporter
        include Singleton
        
        def import(med_xml)
          med_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          med_element = med_xml.at_xpath("./gc32:medication")
          medication = Medication.new
          extract_entry(med_element, medication)
          extract_interval(med_element, medication, "administrationTiming")
          extract_administration_timing(med_element, medication)
          medication.dose = extract_quantity(med_element, "./gc32:dose")
          extract_med_code_attribute(med_element, medication, :type, :typeOfMedication)
          extract_med_code_attribute(med_element, medication, :statusOfMedication)
          extract_med_code_attribute(med_element, medication, :route)
          extract_med_code_attribute(med_element, medication, :site)
          extract_dose_restriction(med_element, medication)
          extract_med_code_attribute(med_element, medication, :indication)
          extract_med_code_attribute(med_element, medication, :productForm)
          extract_med_code_attribute(med_element, medication, :vehicle)
          extract_med_code_attribute(med_element, medication, :reaction)
          extract_med_code_attribute(med_element, medication, :deliveryMethod)
          extract_free_text(med_element, medication, "freeTextSig")
          medication.fulfillment_instructions = extract_node_text(med_element.at_xpath("./gc32:patientInstructions"))
          medication.dose_indicator = extract_node_text(med_element.at_xpath("./gc32:doseIndicator"))
          medication.fulfillment_history = extract_fulfillment_history(med_element)
          medication.order_information = extract_order_information(med_element)
          medication
        end
        
        def extract_administration_timing(element,entry)
          entry.administration_timing = {"period" => extract_quantity(element, "./gc32:administrationTiming/gc32:period"), 
                                         "institutionSpecified" => extract_node_attribute(element.at_xpath("./gc32:administrationTiming"), :institutionSpecified)}
        end
        
        def extract_dose_restriction(element, entry)
          dose_element = element.at_xpath("./gc32:doseRestriction")
          entry.dose_restriction = {"numerator" => extract_quantity(dose_element, "./gc32:numerator"), "denominator" => extract_quantity(dose_element,"./gc32:denominator")}
        end
        
        def extract_fulfillment_history(med_element)
          med_element.xpath("./gc32:fulfillmentHistory").map do |fh_doc|
            fh = FulfillmentHistory.new(quantityDispensed: extract_quantity(fh_doc, "./gc32:quantityDispensed"))
            fh.prescription_number = extract_node_text(fh_doc.at_xpath("./gc32:prescriptionUmber"))
            extract_time(fh_doc, fh,  "./gc32:dispenseDate", :dispense_date)
            fh
          end
        end
        
        def extract_order_information(med_element)
          med_element.xpath("./gc32:orderInformation").map do |oi_doc|
            oi = OrderInformation.new(fills: extract_node_attribute(oi_doc, :fills, true), orderNumber: extract_node_attribute(oi_doc, :orderNumber))
            extract_time(oi_doc, oi, "./gc32:orderDateTime", :order_date_time)
            extract_time(oi_doc, oi, "./gc32:expiresDateTime", :order_expiration_date_time)
            oi
          end
        end
        
        def extract_med_code_attribute(doc, med, attribute, mongo_attribute_name=nil)
          mongo_attribute_name ||= attribute
          extract_code(doc, med, "./gc32:#{attribute}", mongo_attribute_name)
        end
        
      end
    end
  end
end