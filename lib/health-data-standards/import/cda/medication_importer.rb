module HealthDataStandards
  module Import
    module CDA
      
      # TODO: Coded Product Name, Free Text Product Name, Coded Brand Name and Free Text Brand name need to be pulled out separatelty
      #       This would mean overriding extract_codes
      # TODO: Patient Instructions needs to be implemented. Will likely be a reference to the narrative section
      # TODO: Couldn't find an example medication reaction. Isn't clear to me how it should be implemented from the specs, so
      #       reaction is not implemented.
      # TODO: Couldn't find an example dose indicator. Isn't clear to me how it should be implemented from the specs, so
      #       dose indicator is not implemented.
      # TODO: Fill Status is not implemented. Couldn't figure out which entryRelationship it should be nested in
      class MedicationImporter < SectionImporter
        def initialize(entry_finder=EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.112']/cda:entry/cda:substanceAdministration"))
          super(entry_finder)
          @code_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code"
          @description_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference[@value]"
          @type_of_med_xpath = "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.8.1']/cda:code"
          @indication_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:code"
          @vehicle_xpath = "cda:participant/cda:participantRole[cda:code/@code='412307009' and cda:code/@codeSystem='2.16.840.1.113883.6.96']/cda:playingEntity/cda:code"
          @fill_number_xpath = "./cda:entryRelationship[@typeCode='COMP']/cda:sequenceNumber/@value"
          @entry_class = Medication
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          medication = super
          
          if medication.description.present?
            medication.free_text = medication.description
          end
          
          extract_administration_timing(entry_element, medication)
          
          medication.route = extract_code(entry_element, "./cda:routeCode")
          medication.dose = extract_scalar(entry_element, "./cda:doseQuantity")
          medication.site = extract_code(entry_element, "./cda:approachSiteCode", 'SNOMED-CT')
          
          extract_dose_restriction(entry_element, medication)
          
          medication.product_form = extract_code(entry_element, "./cda:administrationUnitCode", 'NCI Thesaurus')
          medication.delivery_method = extract_code(entry_element, "./cda:code", 'SNOMED-CT')
          medication.type_of_medication = extract_code(entry_element, @type_of_med_xpath, 'SNOMED-CT') if @type_of_med_xpath
          medication.indication = extract_code(entry_element, @indication_xpath, 'SNOMED-CT')
          medication.vehicle = extract_code(entry_element, @vehicle_xpath, 'SNOMED-CT')
          
          extract_order_information(entry_element, medication)
          
          extract_fulfillment_history(entry_element, medication)
          extract_negation(entry_element, medication)
          
          medication
        end

        private

        def extract_fulfillment_history(parent_element, medication)
          fhs = parent_element.xpath("./cda:entryRelationship/cda:supply[@moodCode='EVN']")
          if fhs
            fhs.each do |fh_element|
              fulfillment_history = FulfillmentHistory.new
              fulfillment_history.prescription_number = fh_element.at_xpath('./cda:id').try(:[], 'root')
              actor_element = fh_element.at_xpath('./cda:performer')
              if actor_element
                fulfillment_history.provider = import_actor(actor_element)
              end
              hl7_timestamp = fh_element.at_xpath('./cda:effectiveTime').try(:[], 'value')
              fulfillment_history.dispense_date = HL7Helper.timestamp_to_integer(hl7_timestamp) if hl7_timestamp
              fulfillment_history.quantity_dispensed = extract_scalar(fh_element, "./cda:quantity")
              fill_number = fh_element.at_xpath(@fill_number_xpath).try(:text)
              fulfillment_history.fill_number = fill_number.to_i if fill_number
              medication.fulfillmentHistory << fulfillment_history
            end
          end
        end
    
        def extract_order_information(parent_element, medication)
          order_elements = parent_element.xpath("./cda:entryRelationship[@typeCode='REFR']/cda:supply[@moodCode='INT']")
          if order_elements
            order_elements.each do |order_element|
              order_information = OrderInformation.new
              actor_element = order_element.at_xpath('./cda:author')
              if actor_element
                order_information.provider = ProviderImporter.instance.extract_provider(actor_element, "assignedAuthor")
              end
              order_information.order_number = order_element.at_xpath('./cda:id').try(:[], 'root')
              order_information.fills = order_element.at_xpath('./cda:repeatNumber').try(:[], 'value').try(:to_i)
              order_information.quantity_ordered = extract_scalar(order_element, "./cda:quantity")
          
              medication.orderInformation << order_information
            end
          end
        end

        def extract_administration_timing(parent_element, medication)
          administration_timing_element = parent_element.at_xpath("./cda:effectiveTime[2]")
          if administration_timing_element
            at = {}
            if administration_timing_element['institutionSpecified']
              at['institutionSpecified'] = administration_timing_element['institutionSpecified'].to_boolean
            end
            at['period'] = extract_scalar(administration_timing_element, "./cda:period")
            if at.present?
              medication.administration_timing = at
            end
          end
        end

        def extract_dose_restriction(parent_element, medication)
          dre = parent_element.at_xpath("./cda:maxDoseQuantity")
          if dre
            dr = {}
            dr['numerator'] = extract_scalar(dre, "./cda:numerator")
            dr['denominator'] = extract_scalar(dre, "./cda:denominator")
            medication.dose_restriction = dr
          end
        end
      end
    end
  end
end