module HealthDataStandards
  module Import
    module CCDA
      class PatientImporter < C32::PatientImporter
        
        def initialize(check_usable = true)
          @section_importers = {}
          @section_importers[:encounters] = [generate_importer(EncounterImporter, nil, '2.16.840.1.113883.3.560.1.79', 'performed')] #EncounterImporter.new#
          @section_importers[:procedures] = [generate_importer(ProcedureImporter, nil, '2.16.840.1.113883.3.560.1.57', 'performed'),
                                             generate_importer(CDA::ProcedureImporter, "//cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.103' or cda:templateId/@root='2.16.840.1.113883.10.20.22.4.78']", '2.16.840.1.113883.3.560.1.21')] #ProcedureImporter.new#
          @section_importers[:results] = [generate_importer(ResultImporter, nil, '2.16.840.1.113883.3.560.1.5', 'performed')] #ResultImporter.new#
          @section_importers[:vital_signs] = [generate_importer(VitalSignImporter, nil, '2.16.840.1.113883.3.560.1.57', 'performed')] #VitalSignImporter.new#
          @section_importers[:medications] = [generate_importer(MedicationImporter, nil, '2.16.840.1.113883.3.560.1.13'),
                                              generate_importer(CDA::MedicationImporter, "//cda:entry/cda:substanceAdministration[cda:entryRelationship/cda:supply/cda:templateId/@root = '2.16.840.1.113883.10.20.22.4.17']", '2.16.840.1.113883.3.560.1.17', 'ordered'), 
                                              generate_importer(CDA::MedicationImporter, "//cda:entry/cda:substanceAdministration[cda:entryRelationship/cda:supply/cda:templateId/@root = '2.16.840.1.113883.10.20.22.4.18']", '2.16.840.1.113883.3.560.1.8', 'dispensed')]
          @section_importers[:conditions] = [generate_importer(ConditionImporter, nil, '2.16.840.1.113883.3.560.1.2', 'active'), #ConditionImporter.new
                                             generate_importer(Cat1::EcogStatusImporter, nil, '2.16.840.1.113883.3.560.1.1001'),
                                             generate_importer(Cat1::TobaccoUseImporter, nil, '2.16.840.1.113883.3.560.1.1001', 'completed')]
          @section_importers[:social_history] = [CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.38' or cda:templateId/@root='2.16.840.1.113883.10.20.15.3.8']"))]
          @section_importers[:care_goals] = [CareGoalImporter.new]
          @section_importers[:medical_equipment] = [MedicalEquipmentImporter.new]
          @section_importers[:allergies] = [generate_importer(AllergyImporter, nil, '2.16.840.1.113883.3.560.1.1')] #AllergyImporter.new#
          @section_importers[:immunizations] = [generate_importer(ImmunizationImporter, nil, '2.16.840.1.113883.10.20.28.3.112', 'administered')] #ImmunizationImporter.new#
          @section_importers[:insurance_providers] = [InsuranceProviderImporter.new]
        end
        
        def parse_ccda(doc)
          parse_c32(doc)
        end

        def generate_importer(importer_class, xpath, hqmf_oid, status=nil)
          if importer_class.parent_name == "HealthDataStandards::Import::CDA"
            importer = HealthDataStandards::Import::Cat1::EntryPackage.new(importer_class.new(CDA::EntryFinder.new(xpath)), hqmf_oid, status)
          else
            importer = HealthDataStandards::Import::Cat1::EntryPackage.new(importer_class.new, hqmf_oid, status)
          end
          importer
        end

      end
    end
  end
end
