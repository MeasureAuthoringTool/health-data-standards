module HealthDataStandards
  module Import
    module CCR
    # Class that can be used to create an importer for a section of a ASTM CCR document. It usually
    # operates by selecting all CCR entries in a section and then creates entries for them.
      class SectionImporter

        CODE_SYSTEM_MAP = {
          "lnc"       => "LOINC",
          "loinc"     => "LOINC",
          "cpt"       => "CPT",
          "cpt-4"     => "CPT",
          "sct"       => "SNOMED-CT",
          "snomedct"  => "SNOMED-CT",
          "snomed-ct" => "SNOMED-CT",
          "rxnorm"    => "RxNorm",
          "i9cdx"     => "ICD-9-CM",
          "icd-9-cm"  => "ICD-9-CM",
          "icd9-cm"   => "ICD-9-CM",
           "icd9"      => "ICD-9-CM",
          "icd10-cm"   => "ICD-9-CM",
          "icd10"      => "ICD-9-CM",
          "cvx"        => "CVX",
          "hcpcs"      => "HCPCS",
          "cdc"        => "CDC-RE",
          "CDC"        => "CDC-RE",
          "cdc-re"     => "CDC-RE"

        }
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
          coding_system = code.xpath('./ccr:CodingSystem')[0].content.downcase
          coding_system_value = CODE_SYSTEM_MAP[coding_system]
          if(coding_system_value)
            code.xpath('./ccr:CodingSystem')[0].content = coding_system_value
          end
        end

        def extract_status(parent_element, entry)
          status_element = parent_element.at_xpath('./ccr:Status')
          if status_element
            status_text = parent_element.at_xpath('./ccr:Status/ccr:Text')
            return unless status_text
            status = status_text.content.downcase
            if %w(active inactive resolved).include?(status)
              entry.status = status.to_sym
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
          return unless datetime
          Time.parse(datetime).to_i rescue nil
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
          result_element = parent_element.at_xpath('./ccr:TestResult')
          if result_element
            value_element = result_element.at_xpath('./ccr:Value')
            value = value_element ? value_element.content : nil
            unit_element = result_element.at_xpath('./ccr:Units/ccr:Unit')
            unit = unit_element ? unit_element.content : nil
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


    end       # Importer
  end
end         # QME


