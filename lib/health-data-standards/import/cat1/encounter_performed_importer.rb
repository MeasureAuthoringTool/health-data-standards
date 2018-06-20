module HealthDataStandards
  module Import
    module Cat1
      class EncounterPerformedImporter < CDA::EncounterImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']"))
          super(entry_finder)
          @reason_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:observation"
          @principal_diagnosis_xpath = "./cda:entryRelationship/cda:observation[cda:code/@code='8319008']"
          @diagnosis_xpath = "./cda:entryRelationship/cda:act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']"
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          encounter = super
          extract_admit_time(entry_element, encounter)
          extract_reason(entry_element, encounter, nrh)
          encounter.principal_diagnosis = extract_diagnosis(entry_element, @principal_diagnosis_xpath)
          encounter.diagnosis = extract_diagnosis(entry_element, @diagnosis_xpath)
          encounter
        end

        private

        def extract_diagnosis(parent_element, xpath)
          diagnosis_element = parent_element.at_xpath(xpath)
          if(diagnosis_element)
            diagnosis = Entry.new
            extract_workaround_codes(diagnosis_element, diagnosis)
            diagnosis.codes[diagnosis['code_system']] ||= []
            diagnosis.codes[diagnosis['code_system']] << diagnosis['code']
            return diagnosis
          end
          nil
        end

        def extract_reason(parent_element, encounter, nrh)
          reason_element = parent_element.at_xpath(@reason_xpath)
          if reason_element
            reason = Entry.new
            extract_codes(reason_element, reason)
            extract_reason_description(reason_element, reason, nrh)
            extract_status(reason_element, reason)
            extract_dates(reason_element, reason)
            extract_workaround_codes(reason_element, reason)
            encounter.reason = reason
          end
        end

        def extract_workaround_codes(parent_element, entry)
          value = parent_element.at_xpath("./cda:value")
          entry['code'] = value['code']
          entry['code_system'] = CodeSystemHelper.code_system_for(value['codeSystem'])
          entry['codeSystemName'] = CodeSystemHelper.code_system_for(value['codeSystem'])
        end

        def extract_admit_time(parent_element, encounter)
          encounter.admit_time = encounter.start_time
        end

      end
    end
  end
end