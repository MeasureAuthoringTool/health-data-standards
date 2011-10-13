module HealthDataStandards
  module Export
    module C32
      include TemplateHelper

      def export(patient)
        template_format "c32"
        render(:template => 'show', :locals => {:patient => patient})
      end
    end
  end
end