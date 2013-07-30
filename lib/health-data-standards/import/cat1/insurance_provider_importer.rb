module HealthDataStandards
  module Import
    module Cat1
      class InsuranceProviderImporter < CDA::SectionImporter
      
        def initialize
          super(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.55']"))
          @check_for_usable = false # needs to be this way becase InsuranceProvider does not respond
                                    # to usable?
        end

        def create_entry(payer_element, nrh = CDA::NarrativeReferenceHandler.new)
          ip = InsuranceProvider.new
          value_element = payer_element.at_xpath('cda:value')
          ip.codes = { 'SOP' => [value_element['code']] } if value_element
          ip
        end

      end
    end
  end
end