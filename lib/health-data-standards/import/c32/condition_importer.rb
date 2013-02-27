module HealthDataStandards
  module Import
    module C32
      class ConditionImporter < CDA::ConditionImporter
        
        def initialize
          super
          @death_xpath = "./cda:entryRelationship[@typeCode='CAUS']/cda:observation"
          @cod_xpath = "#{@death_xpath}/cda:code[@code='419620001']"
          @time_of_death_xpath = "#{@death_xpath}/cda:effectiveTime/@value"
        end
        
        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          condition = super
          extract_cause_of_death(entry_element, condition)
          extract_type(entry_element, condition)
          condition
        end

        private

        def extract_cause_of_death(entry_element, condition)
          cod = entry_element.at_xpath(@cod_xpath)
          condition.cause_of_death = cod.present?
          time_of_death = entry_element.at_xpath(@time_of_death_xpath)
          condition.time_of_death = HL7Helper.timestamp_to_integer(time_of_death.text) if time_of_death
        end

        def extract_type(entry_element, condition)
          code_element = entry_element.at_xpath('./cda:code')
          if code_element
            condition.type = case code_element['code']
                               when '404684003'  then 'Finding'
                               when '418799008'  then 'Symptom'
                               when '55607006'   then 'Problem'
                               when '409586006'  then 'Complaint'
                               when '64572001'   then 'Condition'
                               when '282291009'  then 'Diagnosis'
                               when '248536006'  then 'Functional limitation'
                               else nil
                             end
          end
        end

      end
    end
  end
end
