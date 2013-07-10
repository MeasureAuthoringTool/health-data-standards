module HealthDataStandards
  module Export
    module Helper
      module Cat1ViewHelper
        include HealthDataStandards::Export::Helper::ScoopedViewHelper

        def render_data_criteria(dc_oid, vs_oid, entries)
          html_array = entries.map do |entry|
              bundle_id = entry.record ? entry.record["bundle_id"] : nil
              vs_map = (value_set_map(bundle_id) || {})[vs_oid]
              binding.pry if vs_map.nil? || vs_map.empty?
              render(:partial => HealthDataStandards::Export::QRDA::EntryTemplateResolver.partial_for(dc_oid, vs_oid), :locals => {:entry => entry,
                                                                                                                                   :value_set_oid => vs_oid,
                                                                                                                                   :value_set_map => vs_map})
          end
          html_array.join("\n")
        end

        def render_patient_data(patient, measures)
          HealthDataStandards.logger.warn("Generating CAT I for #{patient.first} #{patient.last}")
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

      end
    end
  end
end