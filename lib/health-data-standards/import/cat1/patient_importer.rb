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
          # This differs from other HDS patient importers in that sections can have multiple importers
          @section_importers = {}
          @section_importers[:care_goals] = []
          @section_importers[:care_goals] << CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.1']"))

          @section_importers[:conditions] = []
          @section_importers[:conditions] << GestationalAgeImporter.new
          ecog_status_importer = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.103']"))
          ecog_status_importer.code_xpath = './cda:value'
          @section_importers[:conditions] << ecog_status_importer
          symptom_active_importer = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.76']"))
          symptom_active_importer.code_xpath = './cda:value'
          @section_importers[:conditions] << symptom_active_importer

          @section_importers[:medications] = []
          @section_importers[:medications] << CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.105']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.41']"))
          @section_importers[:medications] << CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.41']")) #medication active
          @section_importers[:medications] << CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.42']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']")) #medication administered

          @section_importers[:procedures] = []
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.59']"))
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.3']")) #comm from provider to patient
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.31']")) #intervention ordered
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.32']")) #intervention performed
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.34']")) #intervention result
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.4']")) #comm from provider to provider
          @section_importers[:procedures] << ProcedureOrderImporter.new()
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.64']"))
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.66']"))
          @section_importers[:procedures] << CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.69']"))

          @section_importers[:allergies] = []
          @section_importers[:allergies] << ProcedureIntoleranceImporter.new()
          @section_importers[:allergies] << CDA::AllergyImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.46']"))


          @section_importers[:medical_equipment] = []
          @section_importers[:medical_equipment] << CDA::MedicalEquipmentImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.7']"))

          @section_importers[:results] = []
          @section_importers[:results] << CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.38']")) #lab performed



        end 

        def parse_cat1(doc)
          record = Record.new
          HealthDataStandards::Import::C32::PatientImporter.instance.get_demographics(record, doc)
          import_sections(record, doc)
          record
        end

        def import_sections(record, doc)
          nrh = CDA::NarrativeReferenceHandler.new
          nrh.build_id_map(doc)
          @section_importers.each_pair do |section, importers|
            importers.each do |importer|
              entries = importer.create_entries(doc, nrh)
              record.send(section) << entries
            end
          end
        end

      end
    end
  end
end