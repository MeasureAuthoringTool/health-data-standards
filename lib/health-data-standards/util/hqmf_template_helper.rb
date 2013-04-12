module HealthDataStandards
  module Util
    # General helpers for working with codes and code systems
    class HQMFTemplateHelper
      
      def self.definition_for_template_id(template_id)
        template_id_map[template_id]
      end
      
      def self.template_id_map
        if @id_map.blank?
          template_id_file = File.expand_path('../hqmf_template_oid_map.json', __FILE__)
          @id_map = JSON.parse(File.read(template_id_file))  
        end
        @id_map
      end

      def self.template_id_by_definition_and_status(definition, status, negation=false)
        kv_pair = template_id_map.find {|k, v| v['definition'] == definition && 
                                               v['status'] == status && 
                                               v['negation'] == negation}
        if kv_pair
          kv_pair.first
        else
          nil
        end
      end
    end
  end
end


