require 'ostruct'

module HealthDataStandards
  module Export
    class RenderingContext < OpenStruct
      include TemplateHelper

      def my_binding
        binding
      end
    end
  end
end