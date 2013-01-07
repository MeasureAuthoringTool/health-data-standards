module HealthDataStandards
  module Export
    # Class that finds ERb templates. Here is how it can be configured:
    # [template_format] What format (C32, CCDA, etc) are we looking for. This will cause
    #                   the TemplateHelper to look for template_name.template_format.erb
    # [template_subdir] The sub directory where templates live. If none is provided, it
    #                   will look for templates in the root of the template_directory
    # [template_directory] The root directory to look in for templates. By default, it
    #                      is in the template folder of this gem. It can be handy to
    #                      provide a different directory if you want to use this class
    #                      outside of the HDS gem
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

      # Returns the raw ERb for the template_name provided. This method will look in
      # template_directory/template_subdir/template_name.template_format.erb
      def template(template_name)
        File.read(File.join(template_root, "#{template_name}.#{@template_format}.erb"))
      end

      # Basically the same template, but prepends an underscore to the template name
      # to mimic the Rails convention for template fragments
      def partial(partial_name)
        template("_#{partial_name}")
      end
    end
  end
end