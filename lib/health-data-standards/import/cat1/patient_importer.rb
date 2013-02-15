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
          @section_importers[:care_goals] = [EntryPackage.new(CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.1']")), '2.16.840.1.113883.3.560.1.9')].compact #care goal

          ecog_status_importer = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.103']"))
          ecog_status_importer.code_xpath = './cda:value'
          symptom_active_importer = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.76']"))
          symptom_active_importer.code_xpath = './cda:value'
          
          @section_importers[:conditions] = [EntryPackage.new(GestationalAgeImporter.new, '2.16.840.1.113883.3.560.1.1001'),
                                             EntryPackage.new(ecog_status_importer, '2.16.840.1.113883.3.560.1.1001'),
                                             EntryPackage.new(symptom_active_importer, '2.16.840.1.113883.3.560.1.69', 'active'),
                                             EntryPackage.new(DiagnosisActiveImporter.new, '2.16.840.1.113883.3.560.1.2', 'active'),
                                             EntryPackage.new(CDA::ConditionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.54']")), '2.16.840.1.113883.3.560.1.404'), # patient characteristic age
                                             EntryPackage.new(CDA::ConditionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.14']")), '2.16.840.1.113883.3.560.1.24', 'resolved'), #diagnosis resolved
                                             EntryPackage.new(DiagnosisInactiveImporter.new, '2.16.840.1.113883.3.560.1.23', 'inactive')].compact #diagnosis inactive
  
          
          @section_importers[:medications] = [EntryPackage.new(CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.105']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.41']")), '2.16.840.1.113883.3.560.1.199', 'discharge'), #discharge medication active
                                              EntryPackage.new(CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.41']")), '2.16.840.1.113883.3.560.1.13', 'active'), #medication active
                                              EntryPackage.new(CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.42']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']")), '2.16.840.1.113883.3.560.1.14', 'administered'), #medication administered
                                              EntryPackage.new(CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.47']")), '2.16.840.1.113883.3.560.1.17', 'ordered'), #medication order TODO: ADD NEGATON REASON HANDLING SOMEHOW
                                              EntryPackage.new(MedicationDispensedImporter.new, '2.16.840.1.113883.3.560.1.8', 'dispensed')].compact

          @section_importers[:procedures] = [EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.59']")), '2.16.840.1.113883.3.560.1.57', 'performed'), #physical exam performed
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.3']")), '2.16.840.1.113883.3.560.1.131'), #comm from provider to patient
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.31']")), '2.16.840.1.113883.3.560.1.45', 'ordered'), #intervention ordered
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.32']")), '2.16.840.1.113883.3.560.1.46', 'performed'), #intervention performed
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.34']")), '2.16.840.1.113883.3.560.1.47'), #intervention result
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.4']")), '2.16.840.1.113883.3.560.1.129'), #comm from provider to provider
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.2']")), '2.16.840.1.113883.3.560.1.30'), #comm from patient to provider
                                             EntryPackage.new(ProcedureOrderImporter.new, '2.16.840.1.113883.3.560.1.62', 'ordered'),
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.64']")), '2.16.840.1.113883.3.560.1.6'),
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.66']")), '2.16.840.1.113883.3.560.1.63'),
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.69']")), '2.16.840.1.113883.3.560.1.21'),
                                             EntryPackage.new(CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.18']")), '2.16.840.1.113883.3.560.1.103', 'performed'), #diagnostic study performed
                                             EntryPackage.new(DiagnosticStudyOrderImporter.new, '2.16.840.1.113883.3.560.1.40', 'ordered')].compact

          @section_importers[:allergies] = [EntryPackage.new(ProcedureIntoleranceImporter.new, '2.16.840.1.113883.3.560.1.61'),
                                            EntryPackage.new(CDA::AllergyImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.46']")), '2.16.840.1.113883.3.560.1.67'), #medication intolerance
                                            EntryPackage.new(CDA::AllergyImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.43']")), '2.16.840.1.113883.3.560.1.7'), #medication adverse effect
                                            EntryPackage.new(CDA::AllergyImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.44']")), '2.16.840.1.113883.3.560.1.1')].compact #medication allergy

          @section_importers[:medical_equipment] = [EntryPackage.new(CDA::MedicalEquipmentImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.7']")), '2.16.840.1.113883.3.560.1.110', 'applied')].compact

          @section_importers[:results] = [EntryPackage.new(LabOrderImporter.new, '2.16.840.1.113883.3.560.1.50', 'ordered'), #lab ordered
                                          EntryPackage.new(CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.38']")), '2.16.840.1.113883.3.560.1.5', 'performed'), #lab performed
                                          EntryPackage.new(CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.34']")), '2.16.840.1.113883.3.560.1.47'), #intervention result
                                          EntryPackage.new(CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.57']")), '2.16.840.1.113883.3.560.1.18'), #physical exam finding
                                          EntryPackage.new(CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.28']")), '2.16.840.1.113883.3.560.1.88'), #functional status result    
                                          EntryPackage.new(CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.20']")), '2.16.840.1.113883.3.560.1.111')].compact #diagnostic study result not done

          @section_importers[:encounters] = [EntryPackage.new(CDA::EncounterImporter.new(CDA::EntryFinder.new("//cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']")), '2.16.840.1.113883.3.560.1.79', 'performed'), #encounter performed
                                             EntryPackage.new(EncounterOrderImporter.new, '2.16.840.1.113883.3.560.1.83', 'ordered')].compact

        end 

        def parse_cat1(doc)
          record = Record.new
          HealthDataStandards::Import::C32::PatientImporter.instance.get_demographics(record, doc)
          import_sections(record, doc)
          get_clinical_trial_participant(record, doc)
          record
        end

        def import_sections(record, doc)
          nrh = CDA::NarrativeReferenceHandler.new
          nrh.build_id_map(doc)
          @section_importers.each do |section, entry_packages|
            entry_packages.each do |entry_package|
              record.send(section) << entry_package.package_entries(doc, nrh)
            end
          end
        end

        def get_clinical_trial_participant(record, doc)
          entry_elements = doc.xpath("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.51']")
          record.clinicalTrialParticipant = true unless entry_elements.nil? 
        end
      end
    end
  end
end