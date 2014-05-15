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
        @template_cache = {}
      end

      def template_root
        @template_directory ||= File.join(File.dirname(__FILE__), '..', '..', '..', 'templates')

        if @template_subdir
          return File.join(@template_directory, @template_subdir)
        else
          return @template_directory
        end
      end

      # Returns the raw ERb for the template_name provided. This method will look in
      # template_directory/template_subdir/template_name.template_format.erb
      def template(template_name)
        cache_template(template_name)
      end

      # Basically the same template, but prepends an underscore to the template name
      # to mimic the Rails convention for template fragments
      def partial(partial_name)
        cache_template("_#{partial_name}")
      end

      protected 

      def cache_template(template_name)
        entry = @template_cache[template_name] || {mtime:-1, erb:nil}
        filename = File.join(template_root, "#{template_name}.#{@template_format}.erb")
        mtime = File.mtime(filename).to_i
        if mtime > entry[:mtime]
          src = File.read(filename)
          erb = Erubis::EscapedEruby.new(src)
          erb.filename=filename
          entry[:mtime]=mtime
          entry[:erb] = erb
          @template_cache[template_name]=entry
        end
        entry[:erb]
      end
    end
  end
end