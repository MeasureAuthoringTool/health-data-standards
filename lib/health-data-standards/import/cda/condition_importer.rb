module HealthDataStandards
  module Import
    module CDA
      class ConditionImporter < SectionImporter
        
        def initialize(entry_finder=EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.103']/cda:entry/cda:act/cda:entryRelationship/cda:observation"))
          @entry_finder = entry_finder
          @code_xpath = "./cda:value"
          @id_xpath = "./cda:id"
          @status_xpath = "./cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.50']/cda:value"
          @ordinality_xpath = "./cda:priorityCode"
          @description_xpath = "./cda:text/cda:reference[@value]"
          @provider_xpath = "./cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.27']/cda:performer"
          @priority_xpath = "../cda:sequenceNumber"
          @entry_class = Condition
          @value_xpath = nil
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          condition = super

          extract_ordinality(entry_element, condition)
          extract_negation(entry_element, condition)
          extract_priority(entry_element, condition)

          if @provider_xpath
            entry_element.xpath(@provider_xpath).each do |provider_element|
              condition.treating_provider << import_actor(provider_element)
            end
          end

          condition
        end

        private

        def extract_ordinality(parent_element, entry)
          ordinality_element = parent_element.at_xpath(@ordinality_xpath)
          if ordinality_element
            entry.ordinality = {CodeSystemHelper.code_system_for(ordinality_element['codeSystem']) => [ordinality_element['code']]}
          end
        end

        def extract_priority(entry_element, condition)
          priority_element = entry_element.at_xpath(@priority_xpath)
          if priority_element
            condition.priority = priority_element['value'].to_i
          end
        end
      end
    end
  end
end
