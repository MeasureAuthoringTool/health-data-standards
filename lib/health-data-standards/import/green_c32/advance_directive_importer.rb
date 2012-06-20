module HealthDataStandards
  module Import
    module GreenC32
      class AdvanceDirectiveImporter < SectionImporter
        include Singleton
        
        def import(ad_xml)
          generic_import(ad_xml, "advanceDirective")
        end
        
      end
    end
  end
end