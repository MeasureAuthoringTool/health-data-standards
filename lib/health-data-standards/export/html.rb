module HealthDataStandards
  module Export
    module HTML
      include TemplateHelper

      def export(patient, concept_map=nil)
        self.template_format = "html"
        self.template_subdir = "html"
        render(:template => 'show', :locals => {:patient => patient, :concept_map=>concept_map})
      end

      extend self
      
      
    end
  end
end