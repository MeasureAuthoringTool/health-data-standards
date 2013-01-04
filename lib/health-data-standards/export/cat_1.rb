module HealthDataStandards
  module Export
    class Cat1
      def initialize
        template_helper = HealthDataStandards::Export::TemplateHelper.new('cat1', 'cat1')
        @rendering_context = HealthDataStandards::Export::RenderingContext.new
        @rendering_context.template_helper = template_helper
        @rendering_context.extensions = [HealthDataStandards::Export::Helper::Cat1ViewHelper]
      end

      @@vs_map = nil
      def export(patient, measures, start_date, end_date)
        @rendering_context.render(:template => 'show', :locals => {:patient => patient, :measures => measures, 
                                                :start_date => start_date, :end_date => end_date})
      end
    end
  end
end