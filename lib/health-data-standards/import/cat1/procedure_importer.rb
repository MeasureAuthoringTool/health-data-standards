module HealthDataStandards
  module Import
    module Cat1
      class ProcedureImporter < CDA::ProcedureImporter

        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.4']"))
          super(entry_finder)
          @reference_xpath = "./sdtc:inFulfillmentOf1"
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          procedure = super
          extract_references(entry_element, procedure)
          procedure
        end

        private

        def extract_references(parent_element, entry)
          parent_element.xpath(@reference_xpath).each do |ref_xml|
            ref = Reference.new
            ref.type = case ref_xml.at_xpath("./@typeCode").value
            when "FLFS"
              "fulfills"
            end
            ref.referenced_type = case ref_xml.at_xpath("./sdtc:actReference/@classCode").value
            when "ACT"
              "Procedure"
            end
            id_element = ref_xml.at_xpath("./sdtc:actReference/sdtc:id")
            identifier = CDAIdentifier.new
            identifier.root = id_element['root']
            identifier.extension = id_element['extension']
            ref.referenced_id = identifier
            entry.references << ref
          end
        end

      end
    end
  end
end