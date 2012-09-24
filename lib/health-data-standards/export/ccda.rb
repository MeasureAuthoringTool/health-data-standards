module HealthDataStandards
  module Export
    module CCDA
      include TemplateHelper
      
      def export(patient)
        self.template_format = "ccda"
        self.template_subdir = "ccda"
        render(:template => 'show', :locals => {:patient => patient})
      end

      extend self
    end
  end
end