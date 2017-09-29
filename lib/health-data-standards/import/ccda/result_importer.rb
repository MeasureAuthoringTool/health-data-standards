module HealthDataStandards
  module Import
    module CCDA
      class ResultImporter < CDA::ResultImporter
        def initialize
          super(CDA::EntryFinder.new("//cda:observation[@duplicate='false'][cda:templateId/@root='2.16.840.1.113883.10.20.22.4.2']"))
        end

        def create_entries(doc, nrh = NarrativeReferenceHandler.new)
          mark_duplicate_results(doc)
          super
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

        private
        def mark_duplicate_results(doc)
          ef = CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.2']")
          entries = ef.entries(doc)
          qhMap = {}
          entries.each do |entry|
              keys = []
              code = entry.xpath("cda:code")[0]
              keys << code.attributes["code"].value if code.attributes["code"]

              statusCode = entry.xpath("cda:statusCode")[0]
              keys << statusCode.attributes["code"].value if statusCode.attributes["code"]

              effectiveTime = entry.xpath("cda:effectiveTime")[0]
              keys << effectiveTime.attributes["value"].value if effectiveTime.attributes["value"]

              valueNode = entry.xpath("cda:value")[0]
              keys << valueNode.attributes["nullFlavor"].value if valueNode.attributes["nullFlavor"]
              keys << valueNode.attributes["value"].value if valueNode.attributes["value"]

              plainText = keys.flatten.reject { |c| c.blank? }.join(", ")
              qhash = Digest::MD5.hexdigest(plainText)
              entry["duplicate"] = qhMap[qhash] || false
              qhMap[qhash] = true     
          end
          Rails.logger.info "CCDA resultimporter total #{entries.count} unique #{qhMap.keys.count}"
          qhMap = {}
        end



      end
    end
  end
end