require "date"
# require "date/delta"

module HealthDataStandards
  module Import
    module C32
      class ProviderImporter
        include Singleton
      
        # Extract Healthcare Providers from C32
        #
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        # @return [Array] an array of providers found in the document
        def extract_providers(doc, use_encounters=false)
          xpath_base = use_encounters ? "//cda:encounter/cda:performer" : "//cda:documentationOf/cda:serviceEvent/cda:performer"
  
          performers = doc.xpath(xpath_base)

          providers = performers.map do |performer|
            provider = {}
            entity = performer.xpath(performer, "./cda:assignedEntity")
            name = entity.xpath("./cda:assignedPerson/cda:name")
            provider[:title]        = extract_data(name, "./cda:prefix")
            provider[:given_name]   = extract_data(name, "./cda:given[1]")
            provider[:family_name]  = extract_data(name, "./cda:family")
            provider[:phone]        = extract_data(entity, "./cda:telecom/@value") { |text| text.gsub("tel:", "") }
            provider[:organization] = extract_data(entity, "./cda:representedOrganization/cda:name")
            provider[:specialty]    = extract_data(entity, "./cda:code/@code")
            time                    = performer.xpath(performer, "./cda:time")
            provider[:start]        = extract_date(time, "./cda:low/@value")
            provider[:end]          = extract_date(time, "./cda:high/@value")
            # NIST sample C32s use different OID for NPI vs C83, support both
            npi                     = extract_data(entity, "./cda:id[@root='2.16.840.1.113883.4.6' or @root='2.16.840.1.113883.3.72.5.2']/@extension")
            if Provider.valid_npi?(npi)
              provider[:npi]        = npi
            else
              puts "Warning: Invalid NPI (#{npi})"
            end
            provider
          end
        end
      
        private
      
        def extract_date(subject,query)
          date = extract_data(subject,query)
          date ? Date.parse(date).to_time.to_i : nil
        end
      
        # Returns nil if result is an empty string, block allows text munging of result if there is one
        def extract_data(subject, query)
          result = subject.xpath(query).text
          if result == ""
            nil
          elsif block_given?
            yield(result)
          else
            result
          end
        end
      
      end
    end
  end
end