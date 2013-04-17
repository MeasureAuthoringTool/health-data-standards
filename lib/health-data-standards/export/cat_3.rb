module HealthDataStandards
  module Export
    class Cat3
      def initialize
        template_helper = HealthDataStandards::Export::TemplateHelper.new('cat3', 'cat3')
        @rendering_context = HealthDataStandards::Export::RenderingContext.new
        @rendering_context.template_helper = template_helper
        @cat1_renderer = HealthDataStandards::Export::RenderingContext.new
        @cat1_renderer.template_helper = HealthDataStandards::Export::TemplateHelper.new('cat1', 'cat1')
      end

      def export(measures, effective_date, start_date, end_date, test_id=nil)
        results = {}
        measures.each do |measure|
          results[measure['hqmf_id']] = HealthDataStandards::CQM::QueryCache.aggregate_measure(measure['hqmf_id'], effective_date, test_id)
        end
        @rendering_context.render(:template => 'show', 
                                  :locals => {:measures => measures, :start_date => start_date, 
                                              :end_date => end_date, :cat1_renderer => @cat1_renderer,
                                              :results => results})
      end
    end
  end
end