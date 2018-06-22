module HealthDataStandards
  module Import
    module C32

      # This class is the central location for taking a HITSP C32 XML document and converting it
      # into the processed form we store in MongoDB. The class does this by running each measure
      # independently on the XML document
      #
      # This class is a Singleton. It should be accessed by calling PatientImporter.instance
      class PatientImporter

        include Singleton
        include HealthDataStandards::Util
        include HealthDataStandards::Import::CDA::LocatableImportUtils

        # Creates a new PatientImporter with the following XPath expressions used to find content in 
        # a HITSP C32:
        #
        # Encounter entries
        #    //cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.127']/cda:entry/cda:encounter
        #
        # Procedure entries
        #    //cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.1.29']
        #
        # Result entries - There seems to be some confusion around the correct templateId, so the code checks for both
        #    //cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.15.1'] | //cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.15']
        #
        # Vital sign entries
        #    //cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.14']
        #
        # Medication entries
        #    //cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.112']/cda:entry/cda:substanceAdministration
        #
        # Codes for medications are found in the substanceAdministration with the following relative XPath
        #    ./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code
        #
        # Condition entries
        #    //cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.103']/cda:entry/cda:act/cda:entryRelationship/cda:observation
        #
        # Codes for conditions are determined by examining the value child element as opposed to the code child element
        #
        # Social History entries (non-C32 section, specified in the HL7 CCD)
        #    //cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.19']
        #
        # Care Goal entries(non-C32 section, specified in the HL7 CCD)
        #    //cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.25']
        #
        # Allergy entries
        #    //cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.18']
        #
        # Immunization entries
        #    //cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.1.24']
        #
        # Codes for immunizations are found in the substanceAdministration with the following relative XPath
        #    ./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code
        def initialize(check_usable = true)
          @section_importers = {}
          @section_importers[:encounters] = CDA::EncounterImporter.new
          @section_importers[:procedures] = CDA::ProcedureImporter.new
          @section_importers[:results] = CDA::ResultImporter.new
          @section_importers[:vital_signs] = CDA::VitalSignImporter.new
          @section_importers[:medications] = CDA::MedicationImporter.new
          @section_importers[:conditions] = ConditionImporter.new
          @section_importers[:social_history] = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.19']"))
          @section_importers[:care_goals] = CareGoalImporter.new
          @section_importers[:medical_equipment] = CDA::MedicalEquipmentImporter.new
          @section_importers[:allergies] = CDA::AllergyImporter.new
          @section_importers[:immunizations] = ImmunizationImporter.new
          @section_importers[:insurance_providers] = InsuranceProviderImporter.new
        end

        # @param [boolean] value for check_usable_entries...importer uses true, stats uses false 
        def check_usable(check_usable_entries)
          @section_importers.each_pair do |section, importer|
            importer.check_for_usable = check_usable_entries
          end
        end

        # Parses a HITSP C32 document and returns a Hash of of the patient.
        #
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        # @return [Record] a Mongoid model representing the patient
        def parse_c32(doc)
          c32_patient = Record.new
          get_demographics(c32_patient, doc)
          create_c32_hash(c32_patient, doc)
          check_for_cause_of_death(c32_patient)
          
          c32_patient
        end
        
        # Checks the conditions to see if any of them have a cause of death set. If they do,
        # it will set the expired field on the Record. This is done here rather than replacing
        # the expried method on Record because other formats may actully tell you whether
        # a patient is dead or not.
        # @param [Record] c32_patient to check the conditions on and set the expired
        #               property if applicable
        def check_for_cause_of_death(c32_patient)
          cause_of_death = c32_patient.conditions.detect {|condition| condition.cause_of_death }
          if cause_of_death
            c32_patient.expired = true
            c32_patient.deathdate = cause_of_death.time_of_death
          end
        end

        # Create a simple representation of the patient from a HITSP C32
        # @param [Record] record Mongoid model to append the Entry objects to
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        # @return [Hash] a represnetation of the patient with symbols as keys for each section
        def create_c32_hash(record, doc)
          nrh = CDA::NarrativeReferenceHandler.new
          nrh.build_id_map(doc)
          @section_importers.each_pair do |section, importer|
            record.send(section.to_setter, importer.create_entries(doc, nrh))
          end
        end

        # Inspects a C32 document and populates the patient Hash with first name, last name
        # birth date, gender and the effectiveTime.
        #
        # @param [Hash] patient A hash that is used to represent the patient
        # @param [Nokogiri::XML::Node] doc The C32 document parsed by Nokogiri
        def get_demographics(patient, doc)
          effective_date = doc.at_xpath('/cda:ClinicalDocument/cda:effectiveTime')['value']
          patient.effective_time = HL7Helper.timestamp_to_integer(effective_date)
          patient_role_element = doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole')
          patient_element = patient_role_element.at_xpath('./cda:patient')
          patient.title = patient_element.at_xpath('cda:name/cda:title').try(:text)
          patient.first = patient_element.at_xpath('cda:name/cda:given').text
          patient.last = patient_element.at_xpath('cda:name/cda:family').text
          birthdate_in_hl7ts_node = patient_element.at_xpath('cda:birthTime')
          birthdate_in_hl7ts = birthdate_in_hl7ts_node['value']
          patient.birthdate = HL7Helper.timestamp_to_integer(birthdate_in_hl7ts)

          gender_node = patient_element.at_xpath('cda:administrativeGenderCode')
          patient.gender = gender_node['code']
          id_node = patient_role_element.at_xpath('./cda:id')
          patient.medical_record_number = id_node['extension']
          
          # parse race, ethnicity, and spoken language
          race_node = patient_element.at_xpath('cda:raceCode')
          patient.race = { code: race_node['code'], code_set: 'CDC-RE' } if race_node
          ethnicity_node = patient_element.at_xpath('cda:ethnicGroupCode')
          patient.ethnicity = {code: ethnicity_node['code'], code_set: 'CDC-RE'} if ethnicity_node
          marital_status_node = patient_element.at_xpath("./cda:maritalStatusCode")
          patient.marital_status = {code: marital_status_node['code'], code_set: "HL7 Marital Status"} if marital_status_node
          ra_node = patient_element.at_xpath("./cda:religiousAffiliationCode")
          patient.religious_affiliation = {code: ra_node['code'], code_set: "Religious Affiliation"} if ra_node
          languages = patient_element.search('languageCommunication').map {|lc| lc.at_xpath('cda:languageCode')['code'] }
          patient.languages = languages unless languages.empty?
          
          patient.addresses = patient_role_element.xpath("./cda:addr").map { |addr| import_address(addr) }
          patient.telecoms = patient_role_element.xpath("./cda:telecom").map { |tele| import_telecom(tele) }
          
        end
      end
    end
  end
end
