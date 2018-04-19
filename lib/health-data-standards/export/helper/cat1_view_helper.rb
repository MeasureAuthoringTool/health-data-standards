module HealthDataStandards
  module Export
    module Helper
      module Cat1ViewHelper
        include HealthDataStandards::Export::Helper::ScoopedViewHelper

        def render_data_criteria(dc, entries, r2_compatibility, qrda_version = nil)
          html_array = entries.map do |entry|
              bundle_id = entry.record ? entry.record["bundle_id"] : nil
              vs_map = (value_set_map(bundle_id) || {})[dc['value_set_oid']]
              begin
                render(:partial => HealthDataStandards::Export::QRDA::EntryTemplateResolver.partial_for(dc['data_criteria_oid'], dc['value_set_oid'], qrda_version), :locals => {:entry => entry,
                                                                                                                                   :data_criteria => dc['data_criteria'],
                                                                                                                                   :value_set_oid => dc['value_set_oid'],
                                                                                                                                   :filtered_vs_map => vs_map,
                                                                                                                                   :result_oids => dc["result_oids"],
                                                                                                                                   :field_oids => dc["field_oids"],
                                                                                                                                   :r2_compatibility => r2_compatibility})
              rescue => e
                Rails.logger.info "*****CAT1*** DC: #{dc['data_criteria_oid']}  VS: #{dc['value_set_oid']} #{e.message}"
              end
          end
          html_array.join("\n")
        end

        def render_patient_data(patient, measures, r2_compatibility, qrda_version = nil)
          HealthDataStandards.logger.warn("Generating CAT I for #{patient.first} #{patient.last}")
          udcs = unique_data_criteria(measures, r2_compatibility)

          data_criteria_html = udcs.map do |udc|
            # If there's an error exporting particular criteria, re-raise an error that includes useful debugging info
            begin
              entries = entries_for_data_criteria(udc['data_criteria'], patient)
              render_data_criteria(udc, entries, r2_compatibility, qrda_version)
            rescue => e
              raise HealthDataStandards::Export::PatientExportDataCriteriaException.new(e.message, patient, udc['data_criteria'], entries)
            end
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

        def oid_for_code(codedValue, valueset_oids,  bundle_id = nil)
          return nil if codedValue.nil?
          valueset_oids ||=[]
          code = codedValue["code"]
          code_system = codedValue["code_set"] || codedValue["code_system"] || codedValue["codeSystem"]
          vs_map = (value_set_map(bundle_id) || {})
          valueset_oids.each do |vs_oid|
            oid_list = (vs_map[vs_oid] || [])
            oid_map = Hash[oid_list.collect{|x| [x["set"],x["values"]]}]
            if (oid_map[code_system] || []).include? code
              return vs_oid
            end
          end
          return nil
        end

      end
    end
  end
end
