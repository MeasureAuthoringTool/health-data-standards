module HealthDataStandards
  module Import
    module CDA
      class AllergyImporter < SectionImporter
    
        def initialize(entry_finder=EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.18']"))
          @entry_finder = entry_finder
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingEntity/cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value]"
          @type_xpath = "./cda:code"
          @free_text_xpath= "./cda:participant/cda:participantRole/cda:playingEntity/cda:name"
          @reaction_xpath = "./cda:entryRelationship[@typeCode='MFST']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.54']/cda:value"
          @severity_xpath = "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.55']/cda:value"
          @status_xpath   = "./cda:entryRelationship[@typeCode='REFR']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.39']/cda:value"
          @entry_class = Allergy
        end
    
        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          allergy = super
          allergy.free_text = entry_element.at_xpath(@free_text_xpath).try(:text)
          extract_negation(entry_element, allergy)
          allergy.type = extract_code(entry_element, @type_xpath)
          allergy.reaction = extract_code(entry_element, @reaction_xpath)
          allergy.severity = extract_code(entry_element, @severity_xpath)

          allergy
        end
        
      end
    end
  end
end