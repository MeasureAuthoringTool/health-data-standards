module HealthDataStandards
  module Util
    # General helpers for working with codes and code systems
    class QRDATemplateHelper
      
      def self.definition_for_template_id(template_id)
        template_id_map[template_id]
      end
      
      def self.template_id_map
        if @id_map.blank?
          template_id_file = File.expand_path('../qrda_template_oid_map.json', __FILE__)
          @id_map = JSON.parse(File.read(template_id_file))  
        end
        @id_map
      end

      def self.template_id_by_definition_and_status(definition, status, negation=false)
        pairs = template_id_map.select {|k, v| v['definition'] == definition && 
                                               v['status'] == status && 
                                               v['negation'] == negation}
        pairs.keys.first if pairs.present?
      end
    end
  end
end


