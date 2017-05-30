module HealthDataStandards
  module Export
    class Cat1
      
      def initialize(qrda_version = nil)
        template_helper = HealthDataStandards::Export::TemplateHelper.new('cat1', 'cat1', nil, qrda_version)
        @rendering_context = HealthDataStandards::Export::RenderingContext.new
        @rendering_context.template_helper = template_helper
        @rendering_context.extensions = [HealthDataStandards::Export::Helper::Cat1ViewHelper]
      end


      @@vs_map = nil

      @@most_recent_qrda_version = 'r4'
      @@valid_qrda_versions = ['r4', 'r3_1', 'r3', 'r2']

      #default qrda_version should default to latest version
      def export(patient, measures, start_date, end_date, header=nil, qrda_version='r4', cms_compatibility=false)
        qrda_version = qrda_version.nil? ? @@most_recent_qrda_version : qrda_version

        if (!@@valid_qrda_versions.include? qrda_version)
          raise "Unknown QRDA version provided"
        end

        qrda_template = 'show'
        r2_compatibility = false

        if qrda_version == 'r2'
          r2_compatibility = true
        end
        @rendering_context.render(:template => qrda_template, :locals => {:patient => patient, :measures => measures,
						:start_date => start_date, :end_date => end_date, :header => header, :qrda_version => qrda_version,
						:r2_compatibility => r2_compatibility, :cms_compatibility => cms_compatibility})
      end
    end
  end
end
