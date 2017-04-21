module HealthDataStandards
  module Import
    module CCDA
      class InsuranceProviderImporter < C32::InsuranceProviderImporter
        
        def initialize
          super(CDA::EntryFinder.new("//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.61']
                                    | //cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.60']
                                    | //cda:act[/cda:entryRelationship/cda:observation/cda:templateId/@root='2.16.840.1.113883.10.20.22.4.61']
                                    "))
        end
        
        def create_entry(payer_element, nrh = CDA::NarrativeReferenceHandler.new)
          ip = super(payer_element, nrh)
          value_element = payer_element.at_xpath('cda:value')
          ip.codes = { 'SOP' => [value_element['code']] } if value_element
          extract_dates(payer_element, ip)
          ip
        end

      end
    end
  end
  
end