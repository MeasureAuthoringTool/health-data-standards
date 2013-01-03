module HealthDataStandards
  module Export
    class TemplateHelper
      def initialize(template_format, template_subdir = nil, template_directory = nil)
        @template_format = template_format
        @template_directory = template_directory
        @template_subdir = template_subdir
      end

      def template_root
        @template_directory ||= File.dirname(__FILE__)

        if @template_subdir
          return File.join(@template_directory, '..', '..', '..', 'templates', @template_subdir)
        else
          return File.join(@template_directory, '..', '..', '..', 'templates')
        end
      end

      def template(template_name)
        File.read(File.join(template_root, "#{template_name}.#{@template_format}.erb"))
      end

      def partial(partial_name)
        template("_#{partial_name}")
      end
    end
  end
end