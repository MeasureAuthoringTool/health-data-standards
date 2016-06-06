module HealthDataStandards
  module Export
    module Helper
      module ScoopedViewHelper
        include HealthDataStandards::Util
        include HealthDataStandards::SVS
        VS_MAP = {}

        def value_set_map(bundle_id=nil)
          bundle_id_to_use = nil
          if bundle_id
            bundle_id_to_use = bundle_id
          else
            latest_bundle_id = HealthDataStandards::CQM::Bundle.latest_bundle_id
            bundle_id_to_use = BSON::ObjectId.from_string(latest_bundle_id) if latest_bundle_id
          end
          VS_MAP[bundle_id_to_use] ||= Hash[ValueSet.where({bundle_id: bundle_id_to_use}).map{ |p| [p.oid, p.code_set_map] }]
        end

        # Given a set of measures, find the data criteria/value set pairs that are unique across all of them
        # Returns an Array of Hashes. Hashes will have a three key/value pairs. One for the data criteria oid,
        # one for the value set oid and one for the data criteria itself
        def unique_data_criteria(measures, r2_compatibility)
          all_data_criteria = measures.map {|measure| measure.all_data_criteria}.flatten
          mapped_data_criteria = {}

          all_data_criteria.each do |data_criteria|
            data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition,
                                                                              (data_criteria.status || ""),
                                                                              data_criteria.negation)
          data_criteria_oid ||= HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition,
                                                                                (data_criteria.status || ""),
                                                                                data_criteria.negation, "r2")

            # change a transfer to an encounter since we pull back and write encounters
            if r2_compatibility
              if ['2.16.840.1.113883.3.560.1.71', '2.16.840.1.113883.3.560.1.72'].include? data_criteria_oid
                data_criteria_oid = '2.16.840.1.113883.3.560.1.79'
              end
            end
            value_set_oid = data_criteria.code_list_id
            if data_criteria_oid == '2.16.840.1.113883.3.560.1.71'
              value_set_oid = data_criteria.field_values['TRANSFER_FROM'].code_list_id
            elsif data_criteria_oid == '2.16.840.1.113883.3.560.1.72'
              value_set_oid = data_criteria.field_values['TRANSFER_TO'].code_list_id
            end
            dc = {'data_criteria_oid' => data_criteria_oid, 'value_set_oid' => value_set_oid}
            mapping = mapped_data_criteria[dc] ||= {'result_oids' => [], 'field_oids' =>{}, 'data_criteria' => data_criteria}
            if data_criteria.field_values
              data_criteria.field_values.each_pair do |field,descr|
                if descr && descr.type == "CD"
                  (mapping['field_oids'][field] ||= []) << descr.code_list_id
                end
              end
            end
            if data_criteria.negation
              (mapping['field_oids']["REASON"] ||= []) << data_criteria.negation_code_list_id
            end
            if data_criteria.value && data_criteria.value.type == "CD"
              mapping["result_oids"] << data_criteria.value.code_list_id
            end

            # {'data_criteria_oid' => data_criteria_oid, 'value_set_oid' => value_set_oid, 'data_criteria' => data_criteria}
          end
          # unioned_data_criteria.uniq_by {|thingy| [thingy['data_criteria_oid'], thingy['value_set_oid']]}
          mapped_data_criteria.collect{|dc| dc[0].merge dc[1] }
        end

        # Returns true if the supplied entry matches any of the supplied data criteria, false otherwise
        def entry_matches_criteria(entry, data_criteria_info_list)
          data_criteria_info_list.each do |data_criteria_info|
            data_criteria = data_criteria_info['data_criteria']
            data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition,
                                                                                        data_criteria.status || '',
                                                                                        data_criteria.negation)
            data_criteria_oid ||= HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition,
                                                                                        data_criteria.status || '',
                                                                                        data_criteria.negation, "r2")

            if entry.respond_to?(:oid) && (entry.oid == data_criteria_oid)
              codes = *(value_set_map(entry.record["bundle_id"])[data_criteria_info['value_set_oid']] || [])
              if codes.empty?
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
          is_hqmfr2 = true unless data_criteria_oid 
          data_criteria_oid ||= HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition,
                                                                                      data_criteria.status || '',
                                                                                      data_criteria.negation, "r2")
          HealthDataStandards.logger.warn("Looking for dc [#{data_criteria_oid}]")
          filtered_entries = []
          entries = []
          
          case data_criteria_oid
          when '2.16.840.1.113883.3.560.1.404'
            filtered_entries = handle_patient_expired(patient)
          when '2.16.840.1.113883.3.560.1.405'
            filtered_entries = handle_payer_information(patient)
          else
            entries.concat patient.entries_for_oid(data_criteria_oid)

            case data_criteria_oid
            when '2.16.840.1.113883.3.560.1.5'
              #special case handling for Lab Test: Performed being implicitly available through a Lab Test: Result
              entries.concat patient.entries_for_oid('2.16.840.1.113883.3.560.1.12')
            when '2.16.840.1.113883.3.560.1.12'
              entries.concat patient.entries_for_oid('2.16.840.1.113883.3.560.1.5')
            when '2.16.840.1.113883.3.560.1.6'
               entries.concat patient.entries_for_oid('2.16.840.1.113883.3.560.1.63')
            when  '2.16.840.1.113883.3.560.1.63'
               entries.concat patient.entries_for_oid('2.16.840.1.113883.3.560.1.6')
            when '2.16.840.1.113883.3.560.1.3'
               entries.concat patient.entries_for_oid('2.16.840.1.113883.3.560.1.11')
            when  '2.16.840.1.113883.3.560.1.11'
               entries.concat patient.entries_for_oid('2.16.840.1.113883.3.560.1.3')
            when '2.16.840.1.113883.3.560.1.71', '2.16.840.1.113883.3.560.1.72'
              # transfers
              entries.concat patient.entries_for_oid('2.16.840.1.113883.3.560.1.79')
              if (data_criteria.field_values)
                code_list_id = data_criteria.field_values['TRANSFER_FROM'].try(:code_list_id) || data_criteria.field_values['TRANSFER_TO'].try(:code_list_id)
                codes = (value_set_map(patient["bundle_id"])[code_list_id] || [])
              end
            end

            codes ||= (value_set_map(patient["bundle_id"])[data_criteria.code_list_id] || [])
            if codes.empty?
              HealthDataStandards.logger.warn("No codes for #{data_criteria.code_list_id}")
            end
            entries.uniq! {|e| e["_id"]}
            filtered_entries = entries.find_all do |entry|
              # This special case is for when the code list is a reason
              if data_criteria.code_list_id =~ /2\.16\.840\.1\.113883\.3\.526\.3\.100[7-9]/
                entry.negation_reason.present? && codes.first['values'].include?(entry.negation_reason['code'])
              elsif data_criteria_oid == '2.16.840.1.113883.3.560.1.71'
                if (entry.transferFrom)
                  entry.transferFrom.codes[entry.transferFrom.code_system] = [entry.transferFrom.code]
                  tfc = entry.transferFrom.codes_in_code_set(codes).values.first
                  tfc && !tfc.empty?
                end
              elsif data_criteria_oid == '2.16.840.1.113883.3.560.1.72'
                if (entry.transferTo)
                  entry.transferTo.codes[entry.transferTo.code_system] = [entry.transferTo.code]
                  ttc = entry.transferTo.codes_in_code_set(codes).values.first
                  ttc && !ttc.empty?
                end
              else
                # The !! hack makes sure that negation_ind is a boolean. negations use the same hqmf templates in r2
                entry.is_in_code_set?(codes) && (is_hqmfr2 || !!entry.negation_ind == data_criteria.negation)
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
            [Entry.new]
          else
            []
          end
        end

        def handle_patient_expired(patient)
          if patient.expired
            [OpenStruct.new(start_time: patient.deathdate, id: UUID.generate)]
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
