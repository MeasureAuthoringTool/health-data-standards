module QME
  module Importer
    # Class that can be used to create an importer for a section of a ASTM CCR document. It usually
    # operates by selecting all CCR entries in a section and then creates entries for them.
    class SectionImporterCCR
      attr_accessor :check_for_usable
      # Creates a new SectionImporter
      # @param [String] entry_xpath An XPath expression that can be used to find the desired entries
      # @param [String] section_name   name of the section.   There is some section-dependent processing
      def initialize(entry_xpath,  section_name)
        @entry_xpath = entry_xpath
        @section_name = section_name
        @check_for_usable = true               # Pilot tools will set this to false
      end

      # normalize_coding_system attempts to simplify analysis of the XML doc by 
      # normalizing the names of the coding systems. Input is a single "Code" node
      # in the tree, and the side effect is to edit the CodingSystem subnode.
      # @param [String] code  - Input is a single "Code" node
      def normalize_coding_system(code)
        lookup = {
          "lnc"       => "LOINC",
          "loinc"     => "LOINC",
          "cpt"       => "CPT",
          "cpt-4"     => "CPT",
          "snomedct"  => "SNOMED-CT",
          "snomed-ct" => "SNOMED-CT",
          "rxnorm"    => "RxNorm",
          "icd9-cm"   => "ICD-9-CM",
          "icd9"      => "ICD-9-CM",
          "icd10-cm"   => "ICD-9-CM",
          "icd10"      => "ICD-9-CM",
          "cvx"        => "CVX",
          "hcpcs"      => "HCPCS"

        }
        codingsystem = lookup[code.xpath('./ccr:CodingSystem')[0].content.downcase]
        if(codingsystem)
          code.xpath('./ccr:CodingSystem')[0].content = codingsystem
        end
      end

      def extract_status(parent_element, entry)
        status_element = parent_element.at_xpath('./ccr:Status')
        if status_element
          entry.status = parent_element.at_xpath('./ccr:Status/ccr:Text').content.downcase
          case entry.status
          when "active"
            entry.status = :active
          when "inactive"
            entry.status = :inactive
          else
            entry.status = "INVALID: #{entry.status}"
          end
        end
      end


      # Add the codes from a <Code> block to an Entry
      def extract_codes(parent_element, entry)
        codes = parent_element.xpath("./ccr:Description/ccr:Code")
        entry.description = ""
        if (parent_element.at_xpath("./ccr:Description/ccr:Text") )
          entry.description = parent_element.at_xpath("./ccr:Description/ccr:Text").content
        end
        if codes.size > 0 
          found_code = true
          codes.each do |code|
            normalize_coding_system(code)
            entry.add_code(code.at_xpath("./ccr:Value").content, code.at_xpath("./ccr:CodingSystem").content)
          end
        end
      end

      # Time is supposed to be in iso8601, but seems like we need to handle simple YYYY-MM-DD as well
      def extract_time(datetime)
        # Check for YYYY-MM-DD
        if datetime =~ /^([0-9]{4})-?(1[0-2]|0[1-9])-?(3[0-1]|0[1-9]|[1-2][0-9])$/
          yyyy, mm, dd = $1, $2, $3 
          return Time.mktime(yyyy, mm, dd).to_i
        else
          return Time.iso8601(datetime).to_i
        end

      end

      def extract_dates(parent_element, entry)
        datetime = parent_element.at_xpath('./ccr:DateTime')
        if !datetime
          return
        end
         if datetime.at_xpath('./ccr:ExactDateTime')
          entry.time = extract_time(datetime.at_xpath('./ccr:ExactDateTime').content)
        end
        if datetime.at_xpath('./ccr:ApproximateDateTime')
          entry.time = extract_time(datetime.at_xpath('./ccr:ApproximateDateTime').content)
        end
        if datetime.at_xpath('./ccr:DateTimeRange/ccr:BeginRange')
          entry.start_time = extract_time(datetime.at_xpath('./ccr:DateTimeRange/ccr:BeginRange').content)
        end
        if datetime.at_xpath('./ccr:DateTimeRange/ccr:EndRange')
          entry.end_time = extract_time(datetime.at_xpath('./ccr:DateTimeRange/ccr:EndRange').content)
        end
      end

      def extract_value(parent_element, entry)
#        binding.pry
        value_element = parent_element.at_xpath('./ccr:TestResult')
        if value_element
          value = value_element.at_xpath('./ccr:Value').content
          unit = value_element.at_xpath('./ccr:Units/ccr:Unit').content
          if value
            entry.set_value(value, unit)
          end
        end
      end   # extract_value

      # Traverses that ASTM CCR document passed in using XPath and creates an Array of Entry
      # objects based on what it finds                          
      # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
      #        will have the "ccr" namespace registered to "urn:astm-org:CCR"
      #        measure definition
      # @return [Array] will be a list of Entry objects
      def create_entries(doc)
        return nil
      end
    end
    
    class SectionImporterCCRProduct < SectionImporterCCR
      # Traverses that ASTM CCR document passed in using XPath and creates an Array of Entry
      # objects based on what it finds                          
      # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
      #        will have the "ccr" namespace registered to "urn:astm-org:CCR"
      #        measure definition
      # @return [Array] will be a list of Entry objects
      def create_entries(doc)
        entry_list = []
        entry_elements = doc.xpath(@entry_xpath)
#        binding.pry
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
      #          binding.pry
                 productName = product.at_xpath("./ccr:ProductName")
                brandName = product.at_xpath("./ccr:BrandName")
                productNameText = productName.at_xpath("./ccr:Text")
                brandNameText = brandName.at_xpath("./ccr:Text") 
                entry.description = productNameText.content
                process_product_codes(productName, entry) # we throw any codes found within the productName and brandName into the same entry
                process_product_codes(brandName, entry)
            end


            def create_product_entries(doc)
            end
    end
    class SectionImporterCCRResult < SectionImporterCCR
      # Traverses that ASTM CCR document passed in using XPath and creates an Array of Entry
      # objects based on what it finds                          
      # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
      #        will have the "ccr" namespace registered to "urn:astm-org:CCR"
      #        measure definition
      # @return [Array] will be a list of Entry objects
      def create_entries(doc)
        entry_list = []
        entry_elements = doc.xpath(@entry_xpath)
#        binding.pry
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
     
    class SectionImporterCCRSimple < SectionImporterCCR
      # Traverses that ASTM CCR document passed in using XPath and creates an Array of Entry
      # objects based on what it finds                          
      # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
      #        will have the "ccr" namespace registered to "urn:astm-org:CCR"
      #        measure definition
      # @return [Array] will be a list of Entry objects
      def create_entries(doc)
        entry_list = []
#        binding.pry
        entry_elements = doc.xpath(@entry_xpath)
        entry_elements.each do |entry_element|
          entry = Entry.new
#          binding.pry
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
      
     

  end       # Importer
end         # QME


