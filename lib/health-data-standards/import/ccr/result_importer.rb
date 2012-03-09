module HealthDataStandards
  module Import
    module CCR
      class ResultImporter < SectionImporter
        
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
            # Grab the time and the description from the Result node
            dummy_entry = Entry.new
            extract_dates(entry_element, dummy_entry)
            dummy_entry.description = ""
            if entry_element.at_xpath("./ccr:Description/ccr:Text")
              dummy_entry.description = entry_element.at_xpath("./ccr:Description/ccr:Text").content  
            end
            # Iterate over embedded tests
            # Grab the values and the description from the Test nodes
            # For each test, create an entry with the time from the Result,  the description a concatenation of the Result and Test descriptions, 
            # and the value from the Test

            tests = entry_element.xpath("./ccr:Test")
            tests.each do |test|
              entry = Entry.new
              entry = dummy_entry.clone   # copies time and description
              extract_codes(test, entry)
              extract_value(test, entry)
              extract_status(test, entry)
              extract_dates(test, entry)
              entry.description = dummy_entry.description + ": " + entry.description
              if @check_for_usable
                entry_list << entry if entry.usable?
              else
                entry_list << entry
              end   
            end          
          end
          entry_list        
        end
      end
    end
  end
end