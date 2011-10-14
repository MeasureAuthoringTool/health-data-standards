require 'ostruct'

module HealthDataStandards
  module Export
    class RenderingContext < OpenStruct
      include TemplateHelper
      include ViewHelper

      def my_binding
        binding
      end
    end
  end
end