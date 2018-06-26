module HealthDataStandards
  module Import
    module Cat1
      class AllergyIntoleranceImporter < CDA::SectionImporter
        def initialize
          super(CDA::EntryFinder.new("./cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.147']"))
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingEntity/cda:code"
          @entry_class = Allergy
        end
      end
    end
  end
end