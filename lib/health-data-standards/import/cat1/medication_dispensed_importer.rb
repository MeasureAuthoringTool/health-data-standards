module HealthDataStandards
  module Import
    module Cat1
      class MedicationDispensedImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("//cda:supply[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.45']"))
          super(entry_finder)
          @code_xpath = "./cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code"
          @entry_class = Medication
        end
      end
    end
  end
end