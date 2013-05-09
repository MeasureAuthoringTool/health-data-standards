module HealthDataStandards
  module Export
    module Helper
      module ScoopedViewHelper
        include HealthDataStandards::Util
        include HealthDataStandards::SVS

        def value_set_map
          @@vs_map ||= Hash[*ValueSet.all.map{ |p| [p.oid, p] }.flatten]
        end

        # Given a set of measures, find the data criteria/value set pairs that are unique across all of them
        # Returns an Array of Hashes. Hashes will have a three key/value pairs. One for the data criteria oid,
        # one for the value set oid and one for the data criteria itself
        def unique_data_criteria(measures)
          all_data_criteria = measures.map {|measure| measure.all_data_criteria}.flatten
          unioned_data_criteria = all_data_criteria.map do |data_criteria|
            data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition, 
                                                                              (data_criteria.status || ""),
                                                                              data_criteria.negation)
            value_set_oid = data_criteria.code_list_id
            {'data_criteria_oid' => data_criteria_oid, 'value_set_oid' => value_set_oid, 'data_criteria' => data_criteria}
          end
          unioned_data_criteria.uniq_by {|thingy| [thingy['data_criteria_oid'], thingy['value_set_oid']]}
        end

        # Returns true if the supplied entry matches any of the supplied data criteria, false otherwise
        def entry_matches_criteria(entry, data_criteria_info_list)
          data_criteria_info_list.each do |data_criteria_info|
            data_criteria = data_criteria_info['data_criteria']
            data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition, 
                                                                                        data_criteria.status || '',
                                                                                        data_criteria.negation)
            if entry.respond_to?(:oid) && (entry.oid == data_criteria_oid)
              codes = []
              vs = value_set_map[data_criteria_info['value_set_oid']]
              if vs
                codes = vs.code_set_map
              else
                HealthDataStandards.logger.warn("No codes for #{data_criteria_info['value_set_oid']}")
              end
              if entry.is_in_code_set?(codes) && !!entry.negation_ind == data_criteria.negation
                # The !! hack makes sure that negation_ind is a boolean
                return true
              end
            end
          end
          
          false
        end
        
        # Find all of the entries on a patient that match the given data criteria
        def entries_for_data_criteria(data_criteria, patient)
          data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition, 
                                                                                      data_criteria.status || '',
                                                                                      data_criteria.negation)
          filtered_entries = []
          case data_criteria_oid
          when '2.16.840.1.113883.3.560.1.404'
            filtered_entries = handle_patient_expired(patient)
          when '2.16.840.1.113883.3.560.1.401'
            filtered_entries = handle_clinical_trial_participant(patient)
          when '2.16.840.1.113883.3.560.1.405'
            filtered_entries = handle_payer_information(patient)
          else
            entries = patient.entries_for_oid(data_criteria_oid)
            codes = []
            vs = value_set_map[data_criteria.code_list_id]
            if vs
              codes = vs.code_set_map
            else
              HealthDataStandards.logger.warn("No codes for #{data_criteria.code_list_id}")
            end
            filtered_entries = entries.find_all do |entry|
              # This special case is for when the code list is a reason
              if data_criteria.code_list_id =~ /2\.16\.840\.1\.113883\.3\.526\.3\.100[7-9]/
                entry.negation_reason.present? && codes.first['values'].include?(entry.negation_reason['code'])
              else
                # The !! hack makes sure that negation_ind is a boolean
                entry.is_in_code_set?(codes) && !!entry.negation_ind == data_criteria.negation
              end
            end
          end
          if filtered_entries.empty?
            HealthDataStandards.logger.debug("No entries for #{data_criteria.title}")
          end

          filtered_entries
        end

        def handle_clinical_trial_participant(patient)
          if patient.clinical_trial_participant
            [{dummy_entry: true}]
          else
            []
          end
        end

        def handle_patient_expired(patient)
          if patient.expired
            [OpenStruct.new(start_date: patient.deathdate)]
          else
            []
          end
        end

        def handle_payer_information(patient)
          patient.insurance_providers
        end

      end
    end
  end
end