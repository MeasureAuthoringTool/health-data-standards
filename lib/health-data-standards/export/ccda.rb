module HealthDataStandards
  module Export
    module CCDA
      include TemplateHelper
      
      def template_root
        File.join(File.dirname(__FILE__), '..', '..', '..', 'templates','ccda')
      end

      def export(patient)
        self.template_format = "ccda"
        render(:template => 'show', :locals => {:patient => patient})
      end

      extend self
    end
  end
end