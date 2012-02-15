module HealthDataStandards
  module Import
    module C32
      class ConditionImporter < SectionImporter
        
        def initialize
          @entry_xpath = "//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.11']"
          @code_xpath = "./cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] "
        end
        
        def create_entries(doc, id_map = {})
          @id_map = id_map
          condition_list = []
          entry_elements = doc.xpath(@entry_xpath)
          
          entry_elements.each do |entry_element|
            condition = Condition.new
            
            extract_codes(entry_element, condition)
            extract_dates(entry_element, condition)
            extract_description(entry_element, condition, id_map)
            
            condition.diagnosis_priority = extract_code(entry_element, "???")
            
            condition.problem_date = extract_code(entry_element, 
              "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[@classCode='OBS']/cda.effectiveTime")
              
            condition.problem_type = extract_code(entry_element, 
              "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[@classCode='OBS']")
              
            condition.problem_name = extract_code(entry_element, "./cda:text")

            condition.problem_code = extract_code(entry_element, 
              "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[@classCode='OBS']/cda:code[@code='11450-4']/cda:value[@codeSystem='2.16.840.1.113883.96']")
            
            condition.age_at_onset = extract_code(entry_element, "???")
            
            extract_cause_of_death(entry_element, condition)
            
            condition.problem_status = extract_code(entry_element,
              "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[@classCode='OBS']/cda:statusCode[@code='completed']")

            condition_list << condition
          end
          
          condition_list
        end
        
        private
        
        def extract_cause_of_death(parent_element, condition)
          cause_of_death_element = parent_element.at_xpath("???")
          
          if cause_of_death_element
            condition.cause_of_death = {}
            
            condition.cause_of_death[:time_of_death] = cause_of_death_element.xpath("???")
            condition.cause_of_death[:age_at_death] = cause_of_death_element.xpath("???")
          end
        end
        
      end
    end
  end
end
