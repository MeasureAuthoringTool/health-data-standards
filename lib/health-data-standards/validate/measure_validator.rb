module HealthDataStandards
  module Validate
    class MeasureValidator
      include BaseValidator

      def initialize(template_oid)
        @template_oid = template_oid

      end

      def validate(file, data={})
	@errors = []
	@doc = get_document(file)
	@doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
	measure_ids = HealthDataStandards::CQM::Measure.all.map(&:hqmf_id)
	doc_measure_ids = @doc.xpath(measure_selector).map(&:value).map(&:upcase)
	#list of all of the set ids in the QRDA
	doc_neutral_ids = @doc.xpath(neutral_measure_selector).map(&:value).map(&:upcase).sort
	#list of all of the setids in the QRDA that are also in the bundle, includes duplicates if code appears twice in document
	bundle_neutral_ids = HealthDataStandards::CQM::Measure.distinct(:hqmf_set_id)
	doc_bundle_neutral_ids = doc_neutral_ids - (doc_neutral_ids - bundle_neutral_ids)
	validate_measure_ids(doc_measure_ids, measure_ids, data)
	validate_set_ids(doc_neutral_ids, doc_bundle_neutral_ids, data)
	if validate_no_repeating_measure_population_ids(data)
		validate_measure_ids_set_ids_usage(doc_bundle_neutral_ids, doc_measure_ids, data)
	end

	@errors
      end

      private

		#returns true if there are no repeating measures, check to see that the measure id usage is correct
		def validate_no_repeating_measure_population_ids(data={})
		  noDuplicateMeasures = true
	      doc_population_ids = @doc.xpath(measure_population_selector).map(&:value).map(&:upcase).sort
	      duplicates = doc_population_ids.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)
	      duplicates.each do |duplicate|
	        begin
	          measureId = @doc.xpath(find_measure_node_for_population(duplicate)).at_xpath("cda:reference/cda:externalDocument/cda:id[./@root='2.16.840.1.113883.4.738']/@extension")
	          @errors << build_error("Population #{duplicate} for Measure #{measureId.value} reported more than once", "/", data[:file_name])
	        rescue
	          @errors << build_error("Population #{duplicate} for reported more than once", "/", data[:file_name])
	        end
	        noDuplicateMeasures = false
	      end
	      return noDuplicateMeasures
	  end

      def validate_measure_ids(doc_measure_ids, measure_ids, data={})
	(doc_measure_ids - measure_ids).map do |hqmf_id|
	  @errors << build_error("Invalid HQMF ID Found: #{hqmf_id}", "/", data[:file_name])
	end
      end

      def validate_set_ids(doc_neutral_ids, doc_bundle_neutral_ids, data={})
	#an error will be returned for all of the setids that are in the QRDA that aren't in the bundle
	(doc_neutral_ids - doc_bundle_neutral_ids).map do |hqmf_set_id|
	  @errors << build_error("Invalid HQMF Set ID Found: #{hqmf_set_id}", "/", data[:file_name])
	end
      end

	#does not work if the same measure is reported more than once, nested under the repeating measures test
      def validate_measure_ids_set_ids_usage(doc_bundle_neutral_ids, doc_measure_ids, data={})
	#for each of the setIds that are in the bundle, check that they are for the correct measure id
	entries_start_position = @doc.xpath(first_entry)
	previous = ""
	index = 1
	doc_bundle_neutral_ids.each do |hqmf_set_id|
	  #selects the measure id that is in the same entry as the set id
	  #iterates through multiple instances of the same setId
	  if previous == hqmf_set_id
	    index = index + 1
      else
        index = 1
	  end
	  measure_id_entry = doc_measure_ids[(@doc.xpath(location_of_set_id(hqmf_set_id,index)) - entries_start_position)]
	  previous = hqmf_set_id
	  #queries database to see if there is a measure with the combindation of setId and measureId
	  if HealthDataStandards::CQM::Measure.where(hqmf_id: measure_id_entry, hqmf_set_id: hqmf_set_id).length() == 0
	    @errors << build_error("Invalid HQMF Set ID Found: #{hqmf_set_id} for HQMF ID: #{measure_id_entry}", "/", data[:file_name])
	  end
	end
      end

      def measure_selector
	"/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry" +
	"/cda:organizer[./cda:templateId[@root='#{@template_oid}']]/cda:reference[@typeCode='REFR']" +
        "/cda:externalDocument[@classCode='DOC']/cda:id[@root='2.16.840.1.113883.4.738']/@extension"
      end

      #finds all of the setIds in the QRDA document
      def neutral_measure_selector
	"/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry" +
	"/cda:organizer[./cda:templateId[@root='#{@template_oid}']]/cda:reference[@typeCode='REFR']" +
	"/cda:externalDocument[@classCode='DOC']/cda:setId/@root"
      end

      #finds the node index of the first entry element in the measure template
      def first_entry
	"count(//cda:entry[cda:organizer[./cda:templateId[@root='#{@template_oid}']]" +
	"/cda:reference[@typeCode='REFR']/cda:externalDocument[@classCode='DOC']" +
	"/cda:id[@root='2.16.840.1.113883.4.738']][1]/preceding-sibling::*)+1"
      end

      #finds the node index of the extry that the specified setId is in, index is used if the same setId appears twice
      def location_of_set_id(set_id,index)
	"count(//cda:entry[cda:organizer[./cda:templateId[@root='#{@template_oid}']]" +
	"/cda:reference[@typeCode='REFR']/cda:externalDocument[@classCode='DOC']" +
    "/cda:setId[@root[contains(translate(.,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLOMNOPQRSTUVWXYZ')" +
    ",'#{set_id}')]]][#{index}]/preceding-sibling::*)+1"
      end

	  
	  def measure_population_selector
	  "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry" +
	  "/cda:organizer[./cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:component" +
	  "/cda:observation[./cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:reference" + 
	  "/cda:externalObservation/cda:id/@root"
	  end

	  def find_measure_node_for_population(id)
	  "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry" +
	  "/cda:organizer[ ./cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']" +
	  "and ./cda:component/cda:observation[./cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:reference" +
	  "/cda:externalObservation/cda:id[@root[contains(translate(.,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLOMNOPQRSTUVWXYZ')" +
	  ",'#{id.upcase}')]]]"
	  end
    end
  end

end