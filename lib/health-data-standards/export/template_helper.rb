module HealthDataStandards
  module Export
    module TemplateHelper
      attr_accessor :template_format

      def template_root
        File.join(File.dirname(__FILE__), '..', '..', '..', 'templates')
      end

      def template(template_name)
        File.read(File.join(template_root, "#{template_name}.#{self.template_format}.erb"))
      end

      def partial(partial_name)
        template("_#{partial_name}")
      end

      def render(params)
        erb = nil
        if params[:template]
          erb = template(params[:template])
        elsif params[:partial]
          erb = partial(params[:partial])
        end
        
        locals = params[:locals]
        locals ||= {}
        rendering_context = RenderingContext.new(locals)
        rendering_context.template_format = self.template_format
        eruby = Erubis::EscapedEruby.new(erb)
        eruby.result(rendering_context.my_binding)
      end
    end
  end
end