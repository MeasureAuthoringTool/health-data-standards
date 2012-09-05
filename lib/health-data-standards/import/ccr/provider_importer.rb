require "date"
# require "date/delta"

module HealthDataStandards
  module Import
    module CCR
      class ProviderImporter
        include Singleton
        include ProviderImportUtils

        # Extract Healthcare Providers from CCR
        #
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "ccr" namespace registered to "urn:astm-org:CCR"
        # @return [Array] an array of providers found in the document
        
        def create_provider(actor)
        # Differentiate care providers by content of this field
          provider = {}
          if actor.at_xpath('./ccr:Person/ccr:Name/ccr:CurrentName/ccr:Given')
            provider[:given_name] = extract_data(actor, './ccr:Person/ccr:Name/ccr:CurrentName/ccr:Given')
            provider[:family_name] = extract_data(actor, './ccr:Person/ccr:Name/ccr:CurrentName/ccr:Family')
            provider[:specialty] = extract_data(actor, './ccr:Specialty/ccr:Text')
          end
          
          provider[:specialty] = extract_data(actor, './ccr:Specialty/ccr:Text')

          
          npi_ids = actor.at_xpath("./ccr:IDs[ccr:Type/ccr:Text = \"NPI\"]")
          if npi_ids
            npi_id = npi_ids.at_xpath("./ccr:ID")
            npi = npi_id.content
            provider[:npi] = npi if Provider.valid_npi?(npi)
          end
          
          find_or_create_provider(provider)
        end
        
        
        def extract_providers(doc)

          # Providers are identified as the 'Source' for entries in the CCR.   Sources can also include the patient, relatives, insurance companies, etc
          provider_elements = doc.xpath("//ccr:ContinuityOfCareRecord/ccr:Actors/ccr:Actor[ccr:IDs/ccr:Type/ccr:Text=\"NPI\"]")
          provider_elements.map { |pv| ProviderPerformance.new(provider: create_provider(pv)) }
        end
      end
    end
  end
end