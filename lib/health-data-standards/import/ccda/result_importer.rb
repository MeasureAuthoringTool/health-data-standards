module HealthDataStandards
  module Import
    module CCDA
      class ResultImporter < CDA::ResultImporter
        def initialize
          super(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.2']"))
        end

        def extract_codes(parent_element, entry)
          super
          
          if !entry.codes.present?
            code_elements = parent_element.xpath("../../cda:code")
            code_elements.each do |code_element|
              add_code_if_present(code_element, entry)
              translations = code_element.xpath('cda:translation')
              translations.each do |translation|
                add_code_if_present(translation, entry)
              end
            end
          end

        end

        
        def extract_values(parent_element, entry)
          super
          if !entry.values.present?
            referenceValue = parent_element.xpath("./cda:code/cda:originalText/cda:reference/@value")
            referenceKey = referenceValue.first.value.gsub('#','') if referenceValue && referenceValue.first
            value_element = parent_element.xpath("//cda:content[@ID='#{referenceKey}']/../../cda:td[3]")
            extract_value(parent_element, value_element.first, entry) if value_element.first
          end
        end



      end
    end
  end
end