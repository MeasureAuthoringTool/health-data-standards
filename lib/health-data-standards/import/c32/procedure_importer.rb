module HealthDataStandards
  module Import
    module C32

      # TODO Extract Discharge Disposition
      class ProcedureImporter < SectionImporter

        def initialize
          @entry_xpath = "//cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.1.29']"
          @code_xpath = "./cda:code"
          @status_xpath = "./cda:statusCode"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] "
          @check_for_usable = true               # Pilot tools will set this to false
        end

        # Traverses that HITSP C32 document passed in using XPath and creates an Array of Entry
        # objects based on what it finds                          
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        #        measure definition
        # @return [Array] will be a list of Entry objects
        def create_entries(doc,id_map = {})
          procedure_list = []
          entry_elements = doc.xpath(@entry_xpath)
          entry_elements.each do |entry_element|
            procedure = Procedure.new
            extract_codes(entry_element, procedure)
            extract_dates(entry_element, procedure)
            extract_description(entry_element, procedure, id_map)
            if @check_for_usable
              procedure_list << procedure if procedure.usable?
            else
              procedure_list << procedure
            end
            extract_performer(entry_element, procedure)
            extract_site(entry_element, procedure)
          end
          procedure_list
        end

        private

        def extract_performer(parent_element, procedure)
          performer_element = parent_element.at_xpath("./cda:performer")
          procedure.performer = import_actor(performer_element) if performer_element
        end

        def extract_site(parent_element, procedure)
          procedure.site = extract_code(parent_element, "./cda:targetSiteCode")
        end

      end
    end
  end
end