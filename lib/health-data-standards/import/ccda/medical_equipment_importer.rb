module HealthDataStandards
  module Import
    module CCDA
      class MedicalEquipmentImporter < CDA::MedicalEquipmentImporter
        
        def initialize
          super(CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.23']/cda:entry/cda:supply"))
        end
  
      end
    end
  end
end