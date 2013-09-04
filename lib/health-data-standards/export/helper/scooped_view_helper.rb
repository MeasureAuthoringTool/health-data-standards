module HealthDataStandards
  module Export
    module Helper
      module ScoopedViewHelper
        include HealthDataStandards::Util
        include HealthDataStandards::SVS
        VS_MAP = {}
        def value_set_map(bundle_id=nil)
      
          VS_MAP[bundle_id] ||= Hash[ValueSet.where({bundle_id: bundle_id}).map{ |p| [p.oid, p.code_set_map] }]
        end

        # Given a set of measures, find the data criteria/value set pairs that are unique across all of them
        # Returns an Array of Hashes. Hashes will have a three key/value pairs. One for the data criteria oid,
        # one for the value set oid and one for the data criteria itself
        def unique_data_criteria(measures)
          all_data_criteria = measures.map {|measure| measure.all_data_criteria}.flatten
          mapped_data_criteria = {}
          all_data_criteria.each do |data_criteria|
            data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition, 
                                                                              (data_criteria.status || ""),
                                                                              data_criteria.negation)
            value_set_oid = data_criteria.code_list_id
            dc = {'data_criteria_oid' => data_criteria_oid, 'value_set_oid' => value_set_oid}
            mapping = mapped_data_criteria[dc] ||= {'result_oids' => [], 'field_oids' =>{}, 'data_criteria' => data_criteria}
            
            if data_criteria.field_values
              data_criteria.field_values.each_pair do |field,descr|
                if descr && descr.type == "CD"
                  (mapping['field_oids'][field] ||= []) << descr.code_list_id
                end
              end
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
          HealthDataStandards.logger.warn("Looking for dc [#{data_criteria_oid}]")
          filtered_entries = []
          entries = []
          case data_criteria_oid
          when '2.16.840.1.113883.3.560.1.404'
            filtered_entries = handle_patient_expired(patient)
          when '2.16.840.1.113883.3.560.1.401'
            filtered_entries = handle_clinical_trial_participant(patient)
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
              end
 
            codes = (value_set_map(patient["bundle_id"])[data_criteria.code_list_id] || [])
            if codes.empty?
              HealthDataStandards.logger.warn("No codes for #{data_criteria.code_list_id}")
            end
            entries.uniq! {|e| e["_id"]}
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

        def code_in_valueset( code, valuesets=[],bundle_id=nil)
          unless(bundle_id.nil?)
            bundle = Bundle.find(bundle_id)
            vs_matches = []
            valuesets.each do |vs|
              vset = bundle.valuesets.where({"oid"=>vs}).first
              if vset && vset.concepts.where({"code" => code["code"], "codeSystem" => code["code_system"]}).first
                vs_matches << vs
              end
            end
            return vs_matches
          end
        end
      end
    end
  end
end