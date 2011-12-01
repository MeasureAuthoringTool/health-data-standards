module QME
  module Importer

    # This class is the central location for taking a HITSP C32 XML document and converting it
    # into the processed form we store in MongoDB. The class does this by running each measure
    # independently on the XML document
    #
    # This class is a Singleton. It should be accessed by calling PatientImporter.instance
    class PatientImporter

      include Singleton

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
      def initialize (check_usable = true)
        @measure_importers = {}
        @section_importers = {}
        @id_map = {}
        @section_importers[:encounters] = SectionImporter.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.127']/cda:entry/cda:encounter")
        @section_importers[:procedures] = SectionImporter.new("//cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.1.29']")
        @section_importers[:results] = SectionImporter.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.15.1'] | //cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.15']")
        @section_importers[:vital_signs] = SectionImporter.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.14']")
        @section_importers[:medications] = SectionImporter.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.112']/cda:entry/cda:substanceAdministration",
        "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code",
        nil,
        "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference[@value]")
        @section_importers[:conditions] = SectionImporter.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.103']/cda:entry/cda:act/cda:entryRelationship/cda:observation",
        "./cda:value",
        "./cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.1 13883.10.20.1.50']/cda:value",
        "./cda:text/cda:reference[@value]")
        @section_importers[:social_history] = SectionImporter.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.19']")
        @section_importers[:care_goals] = SectionImporter.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.25']")
        @section_importers[:medical_equipment] = SectionImporter.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.128']/cda:entry/cda:supply",
        "./cda:participant/cda:participantRole/cda:playingDevice/cda:code")
        @section_importers[:allergies] = SectionImporter.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.18']",
        "./cda:participant/cda:participantRole/cda:playingEntity/cda:code")
        @section_importers[:immunizations] = SectionImporter.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.117']/cda:entry/cda:substanceAdministration",
        "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code",
        nil,
        "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference[@value]" )
      end

      def build_id_map(doc)
        id_map = {}
        path = "//*[@ID]"
        ids = doc.xpath(path)
        ids.each do |id|
          tag = id['ID']
          value = id.content
          id_map[tag] = value
        end
        return id_map
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
      # @return [Hash] a representation of the patient that can be inserted into MongoDB
      def parse_c32(doc)
        c32_patient = {}
        entries = create_c32_hash(doc)
        get_demographics(c32_patient, doc)
        process_events(c32_patient, entries)
      end

      # Parses a patient hash containing demographic and event information
      #
      # @param [Hash] patient_hash patient data
      # @return [Hash] a representation of the patient that can be inserted into MongoDB
      def parse_hash(patient_hash)
        patient_record = {}
        patient_record['first'] = patient_hash['first']
        patient_record['patient_id'] = patient_hash['patient_id']
        patient_record['last'] = patient_hash['last']
        patient_record['gender'] = patient_hash['gender']
        patient_record['patient_id'] = patient_hash['patient_id']
        patient_record['birthdate'] = patient_hash['birthdate']
        patient_record['addresses'] = patient_hash['addresses']
        event_hash = {}
        patient_hash['events'].each do |key, value|
          event_hash[key.intern] = parse_events(value)
        end
        process_events(patient_record, event_hash)
      end

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

      # Parses a list of event hashes into an array of Entry objects
      #
      # @param [Array] event_list list of event hashes
      # @return [Array] array of Entry objects
      def parse_events(event_list)
        event_list.collect do |event|
          if event.class==String.class
            # skip String elements in the event list, patient randomization templates
            # introduce String elements to simplify tailing-comma handling when generating
            # JSON using ERb
            nil
          else
            QME::Importer::Entry.from_event_hash(event)
          end
        end.compact
      end

      # Adds a measure to run on a C32 that is passed in
      #
      # @param [MeasureBase] measure an Class that can extract information from a C32 that is necessary
      #        to calculate the measure
      def add_measure(measure_id, importer)
        @measure_importers[measure_id] = importer
      end

      # Create a simple representation of the patient from a HITSP C32
      #
      # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
      #        will have the "cda" namespace registered to "urn:hl7-org:v3"
      # @return [Hash] a represnetation of the patient with symbols as keys for each section
      def create_c32_hash(doc, check_usable_entries = true)
        c32_patient = {}
        id_map = build_id_map(doc)
        @section_importers.each_pair do |section, importer|
          importer.check_for_usable = check_usable_entries
          c32_patient[section] = importer.create_entries(doc,id_map)
        end
        c32_patient
      end

      # Inspects a C32 document and populates the patient Hash with first name, last name
      # birth date and gender.
      #
      # @param [Hash] patient A hash that is used to represent the patient
      # @param [Nokogiri::XML::Node] doc The C32 document parsed by Nokogiri
      def get_demographics(patient, doc)
        patient['first'] = doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:given').text
        patient['last'] = doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:family').text
        birthdate_in_hl7ts_node = doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime')
        birthdate_in_hl7ts = birthdate_in_hl7ts_node['value']
        patient['birthdate'] = HL7Helper.timestamp_to_integer(birthdate_in_hl7ts)
        gender_node = doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:administrativeGenderCode')
        patient['gender'] = gender_node['code']
        id_node = doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:id')
        patient['patient_id'] = id_node['extension']
      end
    end
  end
end
