module HealthDataStandards
  module Import
    module CCDA
      class ProcedureImporter < C32::ProcedureImporter

        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7.1']/cda:entry/cda:*"
          @code_xpath = "./cda:code"
          @status_xpath = "./cda:statusCode"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] "
          @check_for_usable = true               # Pilot tools will set this to false
        end

      end
    end
  end
end