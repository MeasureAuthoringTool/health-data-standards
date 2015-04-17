module HealthDataStandards
  module Validate
    module BaseValidator

      def build_error(msg, loc, file_name)
        ValidationError.new(message: msg, location: loc, file_name: file_name, validator: @name)
      end

      def get_document(input)
        doc = case input
        when File
          input.read
        when Nokogiri::XML::Document
          return input
        else
          input
        end
        Nokogiri::XML(doc.to_s) { |conf| conf.strict.nonet.noblanks } #grumble, grumble nokogiri java @SS 
      end
    end

  end
end
