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
          @section_importers[:care_goals] = [generate_importer(CDA::SectionImporter, "./cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.1']", '2.16.840.1.113883.3.560.1.9')] #care goal
          
          @section_importers[:conditions] = [generate_importer(GestationalAgeImporter, nil, '2.16.840.1.113883.3.560.1.1001'),
                                             generate_importer(EcogStatusImporter, nil, '2.16.840.1.113883.3.560.1.1001'),
                                             generate_importer(SymptomActiveImporter, nil, '2.16.840.1.113883.3.560.1.69', 'active'),
                                             generate_importer(DiagnosisActiveImporter, nil, '2.16.840.1.113883.3.560.1.2', 'active'),
                                             generate_importer(DiagnosisImporter, nil, '2.16.840.1.113883.10.20.28.3.110'),
                                             generate_importer(CDA::ConditionImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.54']", '2.16.840.1.113883.3.560.1.404'), # patient characteristic age
                                             generate_importer(CDA::ConditionImporter, "//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.14']", '2.16.840.1.113883.3.560.1.24', 'resolved'), #diagnosis resolved
                                             generate_importer(DiagnosisInactiveImporter, nil, '2.16.840.1.113883.3.560.1.23', 'inactive'), #diagnosis inactive
                                             generate_importer(ClinicalTrialParticipantImporter, nil, '2.16.840.1.113883.3.560.1.401')]
  
          
          @section_importers[:medications] = [generate_importer(CDA::MedicationImporter, "./cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.105']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.41']", '2.16.840.1.113883.3.560.1.199', 'discharge'), #discharge medication active
                                              generate_importer(MedicationActiveImporter, nil, '2.16.840.1.113883.3.560.1.13', 'active'), #medication active
                                              generate_importer(CDA::MedicationImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.42']/cda:entryRelationship/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']", '2.16.840.1.113883.3.560.1.14', 'administered'), #medication administered
                                              generate_importer(CDA::MedicationImporter, "./cda:entry/cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.47']", '2.16.840.1.113883.3.560.1.17', 'ordered'), #medication order TODO: ADD NEGATON REASON HANDLING SOMEHOW
                                              generate_importer(MedicationDispensedImporter, nil, '2.16.840.1.113883.3.560.1.8', 'dispensed'),
                                              generate_importer(ImmunizationAdministeredImporter, nil, '2.16.840.1.113883.10.20.28.3.112', 'administered')] #immunization
          @section_importers[:communications] = [generate_importer(CDA::CommunicationImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.3']", '2.16.840.1.113883.3.560.1.31'), #comm from provider to patient
                                                 generate_importer(CDA::CommunicationImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.2']", '2.16.840.1.113883.3.560.1.30'), #comm from patient to provider
                                                 generate_importer(CDA::CommunicationImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.4']", '2.16.840.1.113883.3.560.1.129')] #comm from provider to provider, not done
          @section_importers[:procedures] = [generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.59']", '2.16.840.1.113883.3.560.1.57', 'performed'), #physical exam performed
                                             generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.31']", '2.16.840.1.113883.3.560.1.45', 'ordered'), #intervention ordered
                                             generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.32']", '2.16.840.1.113883.3.560.1.46', 'performed'), #intervention performed
                                             generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.34']", '2.16.840.1.113883.3.560.1.47'), #intervention result
                                             generate_importer(ProcedureOrderImporter, nil, '2.16.840.1.113883.3.560.1.62', 'ordered'),
                                             generate_importer(ProcedurePerformedImporter, "./cda:entry/cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.64']", '2.16.840.1.113883.3.560.1.6'),
                                             generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.66']", '2.16.840.1.113883.3.560.1.63'),
                                             generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.69']", '2.16.840.1.113883.3.560.1.21'), #risk category assessment
                                             generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.18']", '2.16.840.1.113883.3.560.1.103', 'performed'), #diagnostic study performed
                                             generate_importer(CDA::ProcedureImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.20']", '2.16.840.1.113883.3.560.1.11'), #diagnostic study result
                                             generate_importer(DiagnosticStudyOrderImporter, nil, '2.16.840.1.113883.3.560.1.40', 'ordered')]

          @section_importers[:allergies] = [generate_importer(ProcedureIntoleranceImporter, nil, '2.16.840.1.113883.3.560.1.61'),
                                            generate_importer(CDA::AllergyImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.46']", '2.16.840.1.113883.3.560.1.67'), #medication intolerance
                                            generate_importer(CDA::AllergyImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.43']", '2.16.840.1.113883.3.560.1.7'), #medication adverse effect
                                            generate_importer(CDA::AllergyImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.44']", '2.16.840.1.113883.3.560.1.1')] #medication allergy

          @section_importers[:medical_equipment] = [generate_importer(CDA::MedicalEquipmentImporter, "./cda:entry/cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.7']", '2.16.840.1.113883.3.560.1.110', 'applied'),
                                                    generate_importer(CDA::MedicalEquipmentImporter, "./cda:entry/cda:act[cda:code/@code = 'SPLY']", '2.16.840.1.113883.3.560.1.137'),
                                                    generate_importer(DeviceOrderImporter, nil, '2.16.840.1.113883.3.560.1.37')]

          @section_importers[:results] = [generate_importer(LabOrderImporter, nil, '2.16.840.1.113883.3.560.1.50', 'ordered'), #lab ordered
                                          generate_importer(CDA::ResultImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.38']", '2.16.840.1.113883.3.560.1.5', 'performed'), #lab performed
                                          generate_importer(CDA::ResultImporter, "./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.34']", '2.16.840.1.113883.3.560.1.47'), #intervention result
                                          generate_importer(CDA::ResultImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.57']", '2.16.840.1.113883.3.560.1.18'), #physical exam finding
                                          generate_importer(CDA::ResultImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.28']", '2.16.840.1.113883.3.560.1.88'), #functional status result  
                                          generate_importer(CDA::ResultImporter, "./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.26']", '2.16.840.1.113883.3.560.1.85'),  #functional status, performed
                                          generate_importer(LabResultImporter, nil, '2.16.840.1.113883.3.560.1.12')] #lab result

          @section_importers[:encounters] = [generate_importer(EncounterPerformedImporter, "./cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']", '2.16.840.1.113883.3.560.1.79', 'performed'), #encounter performed
                                             generate_importer(EncounterOrderImporter, nil, '2.16.840.1.113883.3.560.1.83', 'ordered'),
                                             generate_importer(TransferToImporter, nil, '2.16.840.1.113883.3.560.1.72'),
                                             generate_importer(TransferFromImporter, nil, '2.16.840.1.113883.3.560.1.71')
                                           ]

          @section_importers[:social_history] = [generate_importer(TobaccoUseImporter, nil, '2.16.840.1.113883.3.560.1.1001', 'completed')]

          @section_importers[:insurance_providers] = [generate_importer(InsuranceProviderImporter, nil, '2.16.840.1.113883.3.560.1.405')]

        end 

        def parse_cat1(doc)
          record = Record.new
          HealthDataStandards::Import::C32::PatientImporter.instance.get_demographics(record, doc)
          import_sections(record, doc)
          get_patient_expired(record, doc)
          record.dedup_record!
          normalize_references(record)
          record
        end

        def import_sections(record, doc)

          context = doc.xpath("/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.24.2.1']")
          nrh = CDA::NarrativeReferenceHandler.new
          nrh.build_id_map(doc)
          @section_importers.each do |section, entry_packages|
            entry_packages.each do |entry_package|
              record.send(section) << entry_package.package_entries(context, nrh)
            end
          end
        end

        def get_patient_expired(record, doc)
          entry_elements = doc.xpath("/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.24.2.1']/cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.54']")
          if !entry_elements.empty?
            record.expired = true
            record.deathdate = HealthDataStandards::Util::HL7Helper.timestamp_to_integer(entry_elements.at_xpath("./cda:effectiveTime/cda:low")['value'])
          end
        end

        def normalize_references(record)
          ref_ids = {}
          record.procedures.each do |procedure|
            if procedure.cda_identifier
              ref_ids[procedure.cda_identifier.extension] = procedure._id
            end
          end
          if ref_ids
            record.communications.each do |communication|
              communication.references.each do |reference|
                reference.referenced_id = ref_ids[reference.referenced_id].to_s if ref_ids.has_key?(reference.referenced_id)
              end
            end
          end
        end

        private

        def generate_importer(importer_class, xpath, hqmf_oid, status=nil)
          if importer_class.parent_name == "HealthDataStandards::Import::CDA"
            importer = EntryPackage.new(importer_class.new(CDA::EntryFinder.new(xpath)), hqmf_oid, status)
          else
            importer = EntryPackage.new(importer_class.new, hqmf_oid, status)
          end
          importer
        end
      end
    end
  end
end
