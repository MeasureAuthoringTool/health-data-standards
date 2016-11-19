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

      def export(patient, measures, start_date, end_date, header=nil, qrda_version=nil, cms_compatibility=false)
        # r2_compatibility is being set for backward compatibility, only used in original 'show' templates
        if qrda_version == 'r3_1' 
          qrda_template = 'show_r3_1'
          r2_compatibility = false
        elsif qrda_version == 'r3'
          qrda_template = 'show'
          r2_compatibility = false
        elsif qrda_version == 'r2'
          qrda_template = 'show'
          r2_compatibility = true
        # defaults to QRDA R3 'show' templates (prior to version specific templates)
        else
          qrda_template = 'show'
          r2_compatibility = false
        end
        @rendering_context.render(:template => qrda_template, :locals => {:patient => patient, :measures => measures,
						:start_date => start_date, :end_date => end_date, :header => header, :qrda_version => qrda_version,
						:r2_compatibility => r2_compatibility, :cms_compatibility => cms_compatibility})
      end
    end
  end
end
