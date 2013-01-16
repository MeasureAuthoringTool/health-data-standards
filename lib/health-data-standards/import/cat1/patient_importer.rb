module HealthDataStandards
  module Import
    module Cat1

      # This class is the central location for taking a QRDA Cat 1 XML document and converting it
      # into the processed form we store in MongoDB. The class does this by running each measure
      # independently on the XML document
      #
      # This class is a Singleton. It should be accessed by calling PatientImporter.instance
      class PatientImporter
        include Singleton

        def initialize
          @care_goal_importer = CDA::SectionImporter(CDA::EntryFinder.new("//cda:observation[@templateId='2.16.840.1.113883.10.20.24.3.1']"))

        end

        def parse_cat1(doc)
          record = Record.new
          HealthDataStandards::Import::C32::PatientImporter.instance.get_demographics(record, doc)
          import_care_goals(doc, record)
        end

        def import_care_goals(doc, record)
          record.care_goals = @care_goal_importer.create_entries(doc)
        end

        def import_gestational_age(doc, record)
          
        end
      end
    end
  end
end