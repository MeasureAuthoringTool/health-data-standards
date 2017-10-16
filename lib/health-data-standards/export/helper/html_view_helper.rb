module HealthDataStandards
  module Export
    module Helper
      module HTMLViewHelper
        include HealthDataStandards::Export::Helper::ScoopedViewHelper

        def decode_hqmf_section(section, oid)
          if oid
            definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid)
            definition ||= HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid, 'r2')
            definition['definition'].pluralize.to_sym
          else
            section
          end
        end

        def decode_hqmf_status(status, oid)
          if oid
            definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid)
            definition ||= HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid, 'r2')
            definition['status']
          else
            status
          end
        end

        def decode_hqmf_description(description, oid)
          if oid
            definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid)
            definition ||= HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid, 'r2')
            definition_text = definition['definition']
            status_text = definition['status']
            unless status.blank?
              "#{definition_text.titleize}, #{status_text.titleize}".to_sym
            else
              "#{definition_text.titleize}".to_sym
            end
          else
            description
          end
        end
      end
    end
  end
end
