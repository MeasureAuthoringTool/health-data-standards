module HealthDataStandards
  module Import
    module CCDA
      class ProcedureImporter < CDA::ProcedureImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7.1']/cda:entry/cda:*[@duplicate='false']"))
        end

        def create_entries(doc, nrh = NarrativeReferenceHandler.new)
          mark_duplicate_entries(doc)
          super
        end

        private
        def mark_duplicate_entries(doc)
          ef = CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7.1']/cda:entry/cda:*")
          entries = ef.entries(doc)
          qhMap = {}
          entries.each do |entry|
            keys = []
            code = entry.xpath("cda:code")[0]
            keys << code.attributes["code"].value if code && code.attributes["code"]
          
            statusCode = entry.xpath("cda:statusCode")[0]
            keys << statusCode.attributes["code"].value if statusCode && statusCode.attributes["code"]
          
            effectiveTime = entry.xpath("cda:effectiveTime")[0]
            keys << effectiveTime.attributes["value"].value if effectiveTime && effectiveTime.attributes["value"]
            
            effectiveLowTime = entry.xpath("cda:effectiveTime/cda:low")[0]
            keys << effectiveLowTime.attributes["value"].value if effectiveLowTime && effectiveLowTime.attributes["value"]
            
            effectiveHighTime = entry.xpath("cda:effectiveTime/cda:high")[0]
            keys << effectiveHighTime.attributes["value"].value if effectiveHighTime && effectiveHighTime.attributes["value"]
          
            plainText = keys.flatten.reject { |c| c.blank? }.join(", ")
            qhash = Digest::MD5.hexdigest(plainText)
            entry["duplicate"] = qhMap[qhash] || false
            qhMap[qhash] = true     
          end
          Rails.logger.info "#{Time.now.to_s} CCDA procedureimporter total #{entries.count} unique #{qhMap.keys.count}"
          qhMap = {}
        end

      end
    end
  end
end