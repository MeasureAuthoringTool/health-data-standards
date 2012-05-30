module HealthDataStandards
  module Export
    module HTML
      include TemplateHelper

       def export(patient)
        self.template_format = "html"
        render(:template => 'show', :locals => {:patient => patient})
      end

      extend self


     




    end
  end
end