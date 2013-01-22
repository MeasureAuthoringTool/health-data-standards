module HealthDataStandards
  module Import
    module CDA
      class EntryFinder
        def initialize(entry_xpath)
          @entry_xpath = entry_xpath
        end

        def entries(doc)
          entry_elements = doc.xpath(@entry_xpath)
          if block_given?
            entry_elements.each do |entry_element|
              yield entry_element
            end
          else
            entry_elements
          end
        end
      end
    end
  end
end