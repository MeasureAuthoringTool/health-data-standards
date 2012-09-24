
module HealthDataStandards
  module Util
    # General helpers for working with codes and code systems
    class QRDATemplateHelper
      
      def self.definition_for_template_id(template_id)
        template_id_map[template_id]
      end
      
      def self.template_id_map
        template_id_file = File.expand_path('../qrda_template_oid_map.json', __FILE__)
        JSON.parse(File.read(template_id_file))
      end
      
    end
  end
end


