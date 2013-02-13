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

        def import(doc)
          # This differs from other HDS patient importers in that sections can have multiple importers
          @section_importers = {}
          @section_importers[:care_goals] = [EntryPackage.new(doc, CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.1']")), '2.16.840.1.113883.3.560.1.9').entry].compact #care goal

          ecog_status_importer = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.103']"))
          ecog_status_importer.code_xpath = './cda:value'
          symptom_active_importer = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.76']"))
          symptom_active_importer.code_xpath = './cda:value'
          
          @section_importers[:conditions] = [EntryPackage.new(doc, GestationalAgeImporter.new, '2.16.840.1.113883.3.560.1.1001').entry,
                                             EntryPackage.new(doc, ecog_status_importer, '2.16.840.1.113883.3.560.1.1001').entry,
                                             EntryPackage.new(doc, symptom_active_importer, '2.16.840.1.113883.3.560.1.69', 'active').entry,
                                             EntryPackage.new(doc, DiagnosisActiveImporter.new, '2.16.840.1.113883.3.560.1.2', 'active').entry,
                                             EntryPackage.new(doc, CDA::ConditionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.54']")), '2.16.840.1.113883.3.560.1.404').entry, # patient characteristic age
                                             EntryPackage.new(doc, CDA::ConditionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.14']")), '2.16.840.1.113883.3.560.1.24', 'resolved').entry, #diagnosis resolved
                                             EntryPackage.new(doc, DiagnosisInactiveImporter.new, '2.16.840.1.113883.3.560.1.23', 'inactive').entry].compact #diagnosis inactive
  
          
          @section_importers[:medications] = [EntryPackage.new(doc, CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.105']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.41']")), '2.16.840.1.113883.3.560.1.199', 'discharge').entry, #discharge medication active
                                              EntryPackage.new(doc, CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.41']")), '2.16.840.1.113883.3.560.1.13', 'active').entry, #medication active
                                              EntryPackage.new(doc, CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.42']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']")), '2.16.840.1.113883.3.560.1.14', 'administered').entry, #medication administered
                                              EntryPackage.new(doc, CDA::MedicationImporter.new(CDA::EntryFinder.new("//cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.47']")), '2.16.840.1.113883.3.560.1.17', 'ordered').entry, #medication order TODO: ADD NEGATON REASON HANDLING SOMEHOW
                                              EntryPackage.new(doc, MedicationDispensedImporter.new, '2.16.840.1.113883.3.560.1.8', 'dispensed').entry].compact

          @section_importers[:procedures] = [EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.59']")), '2.16.840.1.113883.3.560.1.57', 'performed').entry, #physical exam performed
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.3']")), '2.16.840.1.113883.3.560.1.131').entry, #comm from provider to patient
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.31']")), '2.16.840.1.113883.3.560.1.45', 'ordered').entry, #intervention ordered
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.32']")), '2.16.840.1.113883.3.560.1.46', 'performed').entry, #intervention performed
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.34']")), '2.16.840.1.113883.3.560.1.47').entry, #intervention result
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.4']")), '2.16.840.1.113883.3.560.1.129').entry, #comm from provider to provider
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.2']")), '2.16.840.1.113883.3.560.1.30').entry, #comm from patient to provider
                                             EntryPackage.new(doc, ProcedureOrderImporter.new, '2.16.840.1.113883.3.560.1.62', 'ordered').entry,
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.64']")), '2.16.840.1.113883.3.560.1.6').entry,
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.66']")), '2.16.840.1.113883.3.560.1.63').entry,
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.69']")), '2.16.840.1.113883.3.560.1.21').entry,
                                             EntryPackage.new(doc, CDA::ProcedureImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.18']")), '2.16.840.1.113883.3.560.1.103', 'performed').entry, #diagnostic study performed
                                             EntryPackage.new(doc, DiagnosticStudyOrderImporter.new, '2.16.840.1.113883.3.560.1.40', 'ordered').entry].compact

          @section_importers[:allergies] = [EntryPackage.new(doc, ProcedureIntoleranceImporter.new, '2.16.840.1.113883.3.560.1.61').entry,
                                            EntryPackage.new(doc, CDA::AllergyImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.46']")), '2.16.840.1.113883.3.560.1.67').entry, #medication intolerance
                                            EntryPackage.new(doc, CDA::AllergyImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.43']")), '2.16.840.1.113883.3.560.1.7').entry, #medication adverse effect
                                            EntryPackage.new(doc, CDA::AllergyImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.44']")), '2.16.840.1.113883.3.560.1.1').entry].compact #medication allergy

          @section_importers[:medical_equipment] = [EntryPackage.new(doc, CDA::MedicalEquipmentImporter.new(CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.7']")), '2.16.840.1.113883.3.560.1.110', 'applied').entry].compact

          @section_importers[:results] = [EntryPackage.new(doc, LabOrderImporter.new, '2.16.840.1.113883.3.560.1.50', 'ordered').entry, #lab ordered
                                          EntryPackage.new(doc, CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.38']")), '2.16.840.1.113883.3.560.1.5', 'performed').entry, #lab performed
                                          EntryPackage.new(doc, CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.34']")), '2.16.840.1.113883.3.560.1.47').entry, #intervention result
                                          EntryPackage.new(doc, CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.57']")), '2.16.840.1.113883.3.560.1.18').entry, #physical exam finding
                                          EntryPackage.new(doc, CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.28']")), '2.16.840.1.113883.3.560.1.88').entry, #functional status result    
                                          EntryPackage.new(doc, CDA::ResultImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.20']")), '2.16.840.1.113883.3.560.1.111').entry].compact #diagnostic study result not done

          @section_importers[:encounters] = [EntryPackage.new(doc, CDA::EncounterImporter.new(CDA::EntryFinder.new("//cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']")), '2.16.840.1.113883.3.560.1.79', 'performed').entry, #encounter performed
                                             EntryPackage.new(doc, EncounterOrderImporter.new, '2.16.840.1.113883.3.560.1.83', 'ordered').entry].compact

        end 

        def parse_cat1(doc)
          record = Record.new
          HealthDataStandards::Import::C32::PatientImporter.instance.get_demographics(record, doc)
          import_sections(record, doc)
          get_clinical_trial_participant(record, doc)
          record
        end

        def import_sections(record, doc)
          self.import(doc)
          @section_importers.each do |section, entries|
            record.send(section) << entries
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