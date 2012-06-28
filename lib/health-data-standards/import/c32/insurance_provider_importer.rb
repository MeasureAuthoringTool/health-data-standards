module HealthDataStandards
  module Import
    module C32
      class InsuranceProviderImporter < SectionImporter
        
        def initialize
          @entry_xpath = "//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.26']"
        end
        
        def create_entries(doc, id_map={})
          doc.xpath(@entry_xpath).map do |payer_element|
            ip = InsuranceProvider.new
            ip.type = extract_code(payer_element, "./cda:code")
            ip.payer = import_organization(payer_element.at_xpath("./cda:performer/cda:assignedEntity"))
            ip.guarantors = extract_guarantors(payer_element.xpath("./cda:performer/cda:assignedEntity"))
            ip.subscriber = import_person(payer_element.at_xpath("./cda:participant[@typeCode='HLD']/cda:participantRole"))
            member_info_element = payer_element.at_xpath("cda:participant[@typeCode='COV']")
            extract_dates(member_info_element, ip, "time")
            name = payer_element.at_xpath("./cda:entryRelationship[@typeCode='REFR']/cda:act[@classCode='ACT' and @moodCode='DEF']/cda:text")
            ip.name = name.try(:text)
            patient_element = member_info_element.at_xpath("./cda:participantRole[@classCode='PAT']")
            ip.member_id = patient_element.at_xpath("./cda:id")
            ip.relationship = extract_code(patient_element, "./cda:code")
            ip.financial_responsibility_type = extract_code(payer_element, "./cda:performer/cda:assignedEntity/cda:code")
          end                  
        end
        
        def extract_guarantors(guarantor_elements)
          guarantor_elements.map do |guarantor_element|
            guarantor = Guarantor.new
            guarantor.person = import_person(guarantor_element.at_xpath("./cda:assignedPerson"))
            guarantor.organization = import_organization(guarantor_element.at_xpath("./cda:representedOrganization"))
            extract_dates(guarantor_element, guarantor, element_name="time")
            guarantor
          end
        end
        
      end
    end
  end
  
end