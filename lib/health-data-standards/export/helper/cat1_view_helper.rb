module HealthDataStandards
  module Export
    module Helper
      module Cat1ViewHelper
        include HealthDataStandards::Util
        include HealthDataStandards::SVS

        def value_set_map
          @@vs_map ||= Hash[*ValueSet.all.map{ |p| [p.oid, p] }.flatten]
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

        # Given a set of measures, find the data criteria/value set pairs that are unique across all of them
        # Returns an Array of Hashes. Hashes will have a three key/value pairs. One for the data criteria oid,
        # one for the value set oid and one for the data criteria itself
        def unique_data_criteria(measures)
          all_data_criteria = measures.map {|measure| measure.all_data_criteria}.flatten
          dc_oids_and_vs_oids = all_data_criteria.map do |data_criteria|
            data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition, 
                                                                              (data_criteria.status || ""),
                                                                              data_criteria.negation)
            value_set_oid = data_criteria.code_list_id
            {'data_criteria_oid' => data_criteria_oid, 'value_set_oid' => value_set_oid, 'data_criteria' => data_criteria}
          end
          dc_oids_and_vs_oids.uniq_by {|thingy| [thingy['data_criteria_oid'], thingy['value_set_oid']]}
        end

        def render_data_criteria(dc_oid, vs_oid, entries)
          html_array = entries.map do |entry|
            if dc_oid == '2.16.840.1.113883.3.560.1.1001'
              # This is a special case. This HQMF OID maps to more than one QRDA OID.
              # So we need to try to figure out what template we should use based on the
              # content of the entry
              if vs_oid == '2.16.840.1.113883.3.526.3.1279'
                # Patient Characteristic Observation Assertion template for
                # Patient Characteristic: ECOG Performance Status-Poor
                render(:partial => '2.16.840.1.113883.10.20.24.3.103', :locals => {:entry => entry,
                                                                                   :value_set_oid => vs_oid})
              elsif vs_oid == "2.16.840.1.113883.3.117.1.7.1.402" || vs_oid == "2.16.840.1.113883.3.117.1.7.1.403" 
                # Patient Charasteristic Gestational Age
                render(:partial => '2.16.840.1.113883.10.20.24.3.101', :locals => {:entry => entry,
                                                                                   :value_set_oid => vs_oid})
              end
            else
              render(:partial => HealthDataStandards::Export::QRDA::EntryTemplateResolver.partial_for(dc_oid), :locals => {:entry => entry,
                                                                                                               :value_set_oid => vs_oid})
            end
          end
          html_array.join("\n")
        end

        def render_patient_data(patient, measures)
          udcs = unique_data_criteria(measures)
          data_criteria_html = udcs.map do |udc|
            entries = entries_for_data_criteria(udc['data_criteria'], patient)
            render_data_criteria(udc['data_criteria_oid'], udc['value_set_oid'], entries)          
          end
          data_criteria_html.compact.join("\n")
        end

        def negation_indicator(entry)
          if entry.negation_ind
            'negationInd="true"'
          else
            ''
          end
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
      end
    end
  end
end