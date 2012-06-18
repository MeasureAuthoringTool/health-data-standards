module HealthDataStandards
  module Import
    module CCDA
      class ResultImporter < C32::ResultImporter
        def initialize
          @entry_xpath = "//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.2']"
          @code_xpath = "./cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] "
        end
      end
    end
  end
end