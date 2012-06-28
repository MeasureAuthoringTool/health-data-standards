module HealthDataStandards
  module Import
    module C32
      class AllergyImporter < SectionImporter
    
        def initialize
          @entry_xpath = "//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.18']"
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingEntity/cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value]"
          @type_xpath = "./cda:code"
          @reaction_xpath = "./cda:entryRelationship[@typeCode='MFST']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.54']/cda:value"
          @severity_xpath = "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.55']/cda:value"
          @status_xpath   = "./cda:entryRelationship[@typeCode='REFR']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.39']/cda:value"
          @id_map = {}
        end
    
        # Traverses that HITSP C32 document passed in using XPath and creates an Array of Entry
        # objects based on what it finds                          
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        #        measure definition
        # @return [Array] will be a list of Entry objects
        def create_entries(doc,id_map = {})
          @id_map = id_map
          allergy_list = []
          entry_elements = doc.xpath(@entry_xpath)
          entry_elements.each do |entry_element|
            allergy = Allergy.new
            extract_codes(entry_element, allergy)
            extract_dates(entry_element, allergy)
            extract_description(entry_element, allergy, id_map)
            
            allergy.status = extract_status(entry_element, allergy)
            allergy.type = extract_code(entry_element, @type_xpath)
            allergy.reaction = extract_code(entry_element, @reaction_xpath)
            allergy.severity = extract_code(entry_element, @severity_xpath)
            
            allergy_list << allergy
          end
          allergy_list
        end
        
      end
    end
  end
end