module HealthDataStandards
  module Import
    module CCR
      class SimpleImporter < SectionImporter
        # Traverses that ASTM CCR document passed in using XPath and creates an Array of Entry
        # objects based on what it finds                          
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "ccr" namespace registered to "urn:astm-org:CCR"
        #        measure definition
        # @return [Array] will be a list of Entry objects
        def create_entries(doc)
          entry_list = []
          entry_elements = doc.xpath(@entry_xpath)
          entry_elements.each do |entry_element|
            entry = Entry.new
            extract_codes(entry_element, entry)
            extract_dates(entry_element, entry)
            extract_status(entry_element, entry)  
            if @check_for_usable
              entry_list << entry if entry.usable?
            else
              entry_list << entry
            end             
          end
          entry_list              
        end
      end
    end
  end
end
