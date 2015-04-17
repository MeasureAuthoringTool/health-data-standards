module HealthDataStandards
  module Validate
    module Schematron
    NAMESPACE = {"svrl" => "http://purl.oclc.org/dsdl/svrl"}
    DIR = File.expand_path("../../../../", __FILE__)
    ISO_SCHEMATRON = File.join(DIR, 'resources/schematron/iso-schematron-xslt1/iso_svrl_for_xslt1.xsl')

      class Validator
        include BaseValidator

        if RUBY_PLATFORM != "java"
          require_relative "schematron/c_processor"
          include Schematron::CProcessor
        else
          require_relative 'schematron/java_processor'
          include Schematron::JavaProcessor
        end

        def initialize(name,schematron_file)
          @name = name
          @schematron_file = schematron_file
        end

        def validate(document,data = {})
          errors = get_errors(document).root.xpath("//svrl:failed-assert",NAMESPACE).map do |el|
            build_error(el.xpath('svrl:text',NAMESPACE).text, el['location'], data[:file_name])
          end
          errors.uniq{|e| "#{e.location}#{e.message}"}
        end

      end
    end
  end
end
