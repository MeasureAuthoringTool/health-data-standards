module HealthDataStandards
  module Export
    # Used to actually render stuff. A RenderingContext needs to be set up with
    # a template helper and may be provided with extensions.
    #
    # :call-seq:
    #   template_helper = HealthDataStandards::Export::TemplateHelper.new('cat1', 'cat1')
    #   rendering_context = HealthDataStandards::Export::RenderingContext.new
    #   rendering_context.template_helper = template_helper
    #   rendering_context.extensions = [HealthDataStandards::Export::Helper::Cat1ViewHelper]
    #
    # In this case, a RenderingContext is being set up to generate Category 1 files. It is
    # passed a template helper to finds the correct ERb templates to render from. It is also
    # given an extension. This is just a Ruby Module which will have its methods exposed to
    # the templates. RenderingContext will assume that extensions is an Array and will include
    # multiple extensions if more than one is provided.  
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
        eruby = Erubis::EscapedEruby.new(erb) # TODO: cache these
        eruby.result(rendering_context.my_binding)
      end
    end
  end
end