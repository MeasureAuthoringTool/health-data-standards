module HealthDataStandards
  module Import
    module CCR
      class ProductImporter < SectionImporter
        
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
            product = entry_element.at_xpath("./ccr:Product")
            process_product(product,entry)
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
        
        # Add the codes from a <Product> block subsection to an Entry
        def process_product_codes(node, entry)
          codes = node.xpath("./ccr:Code")
          if codes.size > 0
            found_code = true
             codes.each do |code|
              normalize_coding_system(code)
              codetext = code.at_xpath("./ccr:CodingSystem").content
              entry.add_code(code.at_xpath("./ccr:Value").content, codetext)
            end
          end
        end

        # Special handling for the medications section
        def process_product (product, entry)
          productName = product.at_xpath("./ccr:ProductName")
          brandName = product.at_xpath("./ccr:BrandName")
          productNameText = productName.at_xpath("./ccr:Text")
          brandNameText = brandName.at_xpath("./ccr:Text")  if brandName
          entry.description = productNameText.content if productNameText
          process_product_codes(productName, entry) # we throw any codes found within the productName and brandName into the same entry
          process_product_codes(brandName, entry) if brandName
        end


        def create_product_entries(doc)
        end
      end
    end
  end
end