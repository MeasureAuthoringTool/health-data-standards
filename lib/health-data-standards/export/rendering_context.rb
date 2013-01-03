require 'ostruct'

module HealthDataStandards
  module Export
    class RenderingContext < OpenStruct
      include ViewHelper
      attr_accessor :template_helper, :extensions

      def my_binding
        binding
      end

      def render(params)
        erb = nil
        if params[:template]
          erb = @template_helper.template(params[:template])
        elsif params[:partial]
          erb = @template_helper.partial(params[:partial])
        end
        
        locals = params[:locals]
        locals ||= {}
        rendering_context = RenderingContext.new(locals)
        rendering_context.template_helper = @template_helper
        if @extensions.present?
          rendering_context.extensions = @extensions
          @extensions.each do |extension|
            rendering_context.extend(extension)
          end
        end
        eruby = Erubis::EscapedEruby.new(erb)
        eruby.result(rendering_context.my_binding)
      end
    end
  end
end