module HealthDataStandards
  module Export
    module GreenC32
      # Module that will create objects that can be used to export GreenCDA sections
      module ExportGenerator
        # Creates an object that can be used to export objects into GreenCDA.
        # @example Creating an results exporter
        #   exporter = ExportGenerator.create_exporter_for(:result)
        #   exporter.export(result) # => Returns GreenCDA XML in a String
        # @param [Symbol] section the section to create the exporter for
        # @return [Object] that has an export method
        def create_exporter_for(section)
          object = Object.new
          object.define_singleton_method(:export) do |section_instance|
            HealthDataStandards::Export::GreenC32::Entry.new.export(section_instance, section)
          end
          object
        end
        extend self
      end
    end
  end
end