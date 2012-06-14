module HealthDataStandards
  module Import
    module GreenC32
      class SocialHistoryImporter < SectionImporter
        include Singleton
        
        def import(sh_xml)
          generic_import(sh_xml, "socialHistory")
        end
      end
    end
  end
end