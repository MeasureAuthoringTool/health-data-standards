module HealthDataStandards
  module Validate
    module Schema
      class Validator
        include BaseValidator

        def initialize(name, schema_file)
          @name = name
          @schema_file = schema_file
          @xsd = Nokogiri::XML::Schema(File.new(@schema_file))
        end

        # Validate the document against the configured schema
        def validate(document,data={})
          @xsd.errors.clear
          doc = get_document(document)
          @xsd.validate(doc).map do |error|
            build_error(error.message, "/", data[:file_name])
          end
        end
      end
    end
  end
end
