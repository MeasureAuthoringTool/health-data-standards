require "time"

module HealthDataStandards
  module Import
    module CCR
    # This class is the central location for taking an ASTM CCR XML document and converting it
    # into the processed form we store in MongoDB. The class does this by running each measure
    # independently on the XML document
    #
    # This class is a Singleton. It should be accessed by calling PatientImporter.instance
      class PatientImporter

        include Singleton
        
        Gender = {"male" => "M", "female" => "F"}
        
        # Creates a new PatientImporter with the following XPath expressions used to find content in 
        # an ASTM CCR
        #
        # Encounter entries
        #    //ccr:Encounters/ccr:Encounter
        # Procedure entries
        #    //ccr:Procedures/ccr:Procedure
        #
        # Result entries - 
        #    //ccr:Results/ccr:Result
        #
        # Vital sign entries
        #    //ccr:VitalSigns/ccr:Result
        #
        # Medication entries
        #    //ccr:Medications/ccr:Medication
        #
        # Codes for medications are found in the Product sections
        #    ./ccr:Product
        #
        # Condition entries
        #    //ccr:Problems/ccr:Problem
        #
        # Social History entries 
        #    //ccr:SocialHistory/ccr:SocialHistoryElement
        #
        # Care Goal entries
        #    //ccr:Goals/ccr:Goal
        #
        # Allergy entries
        #    //ccr:Alerts/ccr:Alert
        #
        # Immunization entries
        #    //ccr:Immunizations/ccr:Immunization
        #
        # Codes for immunizations are found in the substanceAdministration with the following relative XPath
        #    ./ccr:Product
      
        def initialize (check_usable = true)
          @measure_importers = {}
          @section_importers = {}
          @section_importers[:encounters] = SimpleImporter.new("//ccr:Encounters/ccr:Encounter",:encounters)
          @section_importers[:procedures] = SimpleImporter.new("//ccr:Procedures/ccr:Procedure",:procedures)
          @section_importers[:results] = ResultImporter.new("//ccr:Results/ccr:Result",:results)
          @section_importers[:vital_signs] = ResultImporter.new("//ccr:VitalSigns/ccr:Result",:vital_signs)
          @section_importers[:medications] = ProductImporter.new("//ccr:Medications/ccr:Medication", :medications)
          @section_importers[:conditions] = SimpleImporter.new("//ccr:Problems/ccr:Problem",:conditions)
          @section_importers[:social_history] = SimpleImporter.new("//ccr:SocialHistory/ccr:SocialHistoryElement", :social_history)
          @section_importers[:care_goals] = SimpleImporter.new("//ccr:Goals/ccr:Goal",:care_goals)
          @section_importers[:medical_equipment] = ProductImporter.new("//ccr:Equipment/ccr:EquipmentElement",:medical_equipment)
          @section_importers[:allergies] = SimpleImporter.new("//ccr:Alerts/ccr:Alert",:allergies)
          @section_importers[:immunizations] = ProductImporter.new("//ccr:Immunizations/ccr:Immunization",:immunizations)
        end

 
        # @param [boolean] value for check_usable_entries...importer uses true, stats uses false 
        def check_usable(check_usable_entries)
          @section_importers.each_pair do |section, importer|
            importer.check_for_usable = check_usable_entries
          end
        end

        # Parses a ASTM CCR document and returns a Hash of of the patient.
        #
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "ccr" namespace registered to ""urn:astm-org:CCR""
        # @return [Hash] a representation of the patient that can be inserted into MongoDB
        def parse_ccr(doc, patient_id_xpath="//ccr:ContinuityOfCareRecord/ccr:Patient/ccr:ActorID")
          ccr_patient = {}
          entries = create_hash(doc)
          get_demographics(ccr_patient, doc, patient_id_xpath)
          process_events(ccr_patient, entries)
          Record.new(ccr_patient)
        end
        # 
        # # Parses a patient hash containing demographic and event information
        # #
        # # @param [Hash] patient_hash patient data
        # # @return [Hash] a representation of the patient that can be inserted into MongoDB
        # def parse_hash(patient_hash)
        #   patient_record = {}
        #   patient_record['first'] = patient_hash['first']
        #   patient_record['patient_id'] = patient_hash['patient_id']
        #   patient_record['last'] = patient_hash['last']
        #   patient_record['gender'] = patient_hash['gender']
        #   patient_record['patient_id'] = patient_hash['patient_id']
        #   patient_record['birthdate'] = patient_hash['birthdate']
        #   patient_record['race'] = patient_hash['race']
        #   patient_record['ethnicity'] = patient_hash['ethnicity']
        #   patient_record['languages'] = patient_hash['languages']
        #   patient_record['addresses'] = patient_hash['addresses']
        #   event_hash = {}
        #   patient_hash['events'].each do |key, value|
        #     event_hash[key.intern] = parse_events(value)
        #   end
        #   process_events(patient_record, event_hash)
        # end

        # Adds the entries and denormalized measure information to the patient_record.
        # Each Entry will be converted to a Hash and stored in an Array under the appropriate
        # section key, such as medications. Measure information is listed under the measures
        # key which has a Hash value. The Hash has the measure id as a key, and the denormalized
        # measure information as a value
        #
        # @param patient_record - Hash with basic patient demographic information
        # @entries - Hash of entries with section names a keys and an Array of Entry values
        def process_events(patient_record, entries)
          patient_record['measures'] = {}
          @measure_importers.each_pair do |measure_id, importer|
            patient_record['measures'][measure_id] = importer.parse(entries)
          end


          entries.each_pair do |key, value|
            patient_record[key] = value.map do |e|
              if e.usable?
                e.to_hash
              else
                nil
              end
            end.compact
          end
          patient_record
        end

        # # Parses a list of event hashes into an array of Entry objects
        # #
        # # @param [Array] event_list list of event hashes
        # # @return [Array] array of Entry objects
        # def parse_events(event_list)
        #   event_list.collect do |event|
        #     if event.class==String.class
        #       # skip String elements in the event list, patient randomization templates
        #       # introduce String elements to simplify tailing-comma handling when generating
        #       # JSON using ERb
        #       nil
        #     else
        #       QME::Importer::Entry.from_event_hash(event)
        #     end
        #   end.compact
        # end

        # Adds a measure to run on a CCR that is passed in
        #
        # @param [MeasureBase] measure an Class that can extract information from a CCR that is necessary
        #        to calculate the measure
        def add_measure(measure_id, importer)
          @measure_importers[measure_id] = importer
        end

        # Create a simple representation of the patient from an ASTM CCR
        #
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "ccr" namespace registered to ""urn:astm-org:CCR""
        # @return [Hash] a represnetation of the patient with symbols as keys for each section
        def create_hash(doc, check_usable_entries = false)
          ccr_patient = {}
          @section_importers.each_pair do |section, importer|
            importer.check_for_usable = check_usable_entries
            ccr_patient[section] = importer.create_entries(doc)
          end
          ccr_patient
        end

        # Inspects a CCR document and populates the patient Hash with first name, last name
        # birth date and gender.
        #
        # @param [Hash] patient A hash that is used to represent the patient
        # @param [Nokogiri::XML::Node] doc The CCR document parsed by Nokogiri
        def get_demographics(patient, doc, patient_id_xpath)
          patientActorID = doc.at_xpath("//ccr:ContinuityOfCareRecord/ccr:Patient/ccr:ActorID").content
          patientActor = doc.at_xpath("//ccr:ContinuityOfCareRecord/ccr:Actors/ccr:Actor[ccr:ActorObjectID = \"#{patientActorID}\"]")
          patientID = patientActor.at_xpath(patient_id_xpath).try(:content)
          patientID ||= patientActorID
          
          name_element = patientActor.at_xpath('./ccr:Person/ccr:Name')
          
          if name_element
            if name_element.at_xpath("./ccr:CurrentName")
              patient['first'] = name_element.at_xpath('./ccr:CurrentName/ccr:Given').try(:content)
              patient['last'] = name_element.at_xpath('./ccr:CurrentName/ccr:Family').try(:content)
            elsif name_element.at_xpath("./ccr:DisplayName")
              # this will not work in all cases, but we're using it as a last resort if no CurrentName is found
              first, last = name_element.at_xpath("./ccr:DisplayName").content.split(" ")
              patient['first'] = first.strip
              patient['last'] = last.strip
            end
          end
              
          
          birthdate = patientActor.at_xpath('./ccr:Person//ccr:DateOfBirth/ccr:ExactDateTime | ./ccr:Person//ccr:DateOfBirth/ccr:ApproximateDateTime')
          patient['birthdate'] = Time.parse(birthdate.content).to_i if birthdate
          
          gender_string = patientActor.at_xpath('./ccr:Person/ccr:Gender/ccr:Text').content.downcase
          patient['gender'] =  Gender[gender_string.downcase]
          #race_node = doc.at_xpath('/ccr:placeholder')    #how do you find this?
          race = doc.at_xpath('//ccr:SocialHistory/ccr:SocialHistoryElement[./ccr:Type/ccr:Text = "Race"]/ccr:Description/ccr:Code[./ccr:CodingSystem = "CDC-RE"]/ccr:Value')
          ethnicity = doc.at_xpath('//ccr:SocialHistory/ccr:SocialHistoryElement[./ccr:Type/ccr:Text = "Ethnicity"]/ccr:Description/ccr:Code[./ccr:CodingSystem = "CDC-RE"]/ccr:Value')
          
          if ethnicity
            patient[:ethnicity] = {"code" => ethnicity.text, "codeSystem" => 'CDC-RE'}
          end
         
          
          if race
             patient[:race] = {"code" => race.text, "codeSystem" => 'CDC-RE'}
          end

         
         
          #ethnicity_node = doc.at_xpath()
          

          # languages = doc.at_xpath()
          patient['languages'] = nil
 
          patient['medical_record_number'] = patientID
        end
      end
    end
  end
end
