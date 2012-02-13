require "date"
require "date/delta"

module QME
  module Importer
    class ProviderImporterCCR
      include Singleton

      # Extract Healthcare Providers from CCR
      #
      # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
      #        will have the "ccr" namespace registered to "urn:astm-org:CCR"
      # @return [Array] an array of providers found in the document
      def extract_providers(doc)

        # Providers are identified as the 'Source' for entries in the CCR.   Sources can also include the patient, relatives, insurance companies, etc
        actorIDs = doc.xpath("//ccr:Source/ccr:Actor/ccr:ActorID")
        uniqueActorIDs = {}
        actorIDs.each do |actorID|
          uniqueActorIDs[actorID.content] = actorID.content
        end
        actorIDs = uniqueActorIDs.keys
        providers = actorIDs.map do |actorID|
          provider = nil
          actor = doc.at_xpath("//ccr:ContinuityOfCareRecord/ccr:Actors/ccr:Actor[ccr:ActorObjectID = \"#{actorID}\"]")
          if(actor)
            # Differentiate care providers by content of this field
            if actor.at_xpath("./ccr:Source/ccr:Actor/ccr:ActorRole/ccr:Text") && 
               actor.at_xpath("./ccr:Source/ccr:Actor/ccr:ActorRole/ccr:Text").content.downcase =~ /care provider/
              provider = {}
              if actor.at_xpath('./ccr:Person/ccr:Name/ccr:CurrentName/ccr:Given')
                provider[:given_name] = actor.at_xpath('./ccr:Person/ccr:Name/ccr:CurrentName/ccr:Given').content
                provider[:family_name] = actor.at_xpath('./ccr:Person/ccr:Name/ccr:CurrentName/ccr:Family').content
              end
              if actor.at_xpath('./ccr:Specialty/ccr:Text')
                provider[:specialty]    = actor.at_xpath('./ccr:Specialty/ccr:Text').content
              end
              if actor.at_xpath("ccr:Telephone/ccr:Value")
                provider[:phone] = actor.at_xpath("ccr:Telephone/ccr:Value").content
              end
=begin
              # Not clear precisely how NPI would be specified
              if actor.at_xpath("ccr:IDs/ccr:Type[ccr:Text = \"NPI\"]")
                npinode = actor.at_xpath("ccr:IDs/ccr:Type[ccr:Text = \"NPI\"]")
                npi = npinode.ID.content
                if ProviderImporterC32::valid_npi?(npi)
                  provider[:npi]        = npi
                else
                  puts "Warning: Invalid NPI (#{npi})"
                end   #valid NPI
              end #has NPI
=end
            end #is a provider
          end   #is an actor
            provider
        end.compact
      end
    end
  end
end