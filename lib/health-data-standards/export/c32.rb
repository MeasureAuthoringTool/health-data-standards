module HealthDataStandards
  module Export
    module C32
      include TemplateHelper

      def export(patient)
        self.template_format = "c32"
        render(:template => 'show', :locals => {:patient => patient})
      end

      extend self
    end
  end
end