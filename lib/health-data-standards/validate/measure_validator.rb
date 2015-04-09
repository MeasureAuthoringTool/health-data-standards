module HealthDataStandards
  module Validate
    class MeasureValidator
      include BaseValidator

      def initialize(template_oid)
        @template_oid = template_oid
      end

      def validate(file, data={})
        doc = get_document(file)
        doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
        measure_ids = HealthDataStandards::CQM::Measure.all.map(&:hqmf_id)
        doc_measure_ids = doc.xpath(measure_selector).map(&:value)
        (doc_measure_ids - measure_ids).map do |hqmf_id|
          build_error("Invalid HQMF ID Found: #{hqmf_id}", "/", data[:file_name])
        end
      end

      private

      def measure_selector
        "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry" +
        "/cda:organizer[./cda:templateId[@root='#{@template_oid}']]/cda:reference[@typeCode='REFR']" +
        "/cda:externalDocument[@classCode='DOC']/cda:id[@root='2.16.840.1.113883.4.738']/@extension"
      end

    end
  end
	
end