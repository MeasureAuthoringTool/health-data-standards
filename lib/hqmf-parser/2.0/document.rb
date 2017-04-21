module HQMF2
  # Class representing an HQMF document
  class Document
    include HQMF2::Utilities, HQMF2::DocumentUtilities
    NAMESPACES = { 'cda' => 'urn:hl7-org:v3',
                   'xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
                   'qdm' => 'urn:hhs-qdm:hqmf-r2-extensions:v1' }

    attr_reader :measure_period, :id, :hqmf_set_id, :hqmf_version_number, :populations, :attributes,
                :source_data_criteria

    # Create a new HQMF2::Document instance by parsing the given HQMF contents
    # @param [String] containing the HQMF contents to be parsed
    def initialize(hqmf_contents, use_default_measure_period = true)
      setup_default_values(hqmf_contents, use_default_measure_period)

      extract_criteria

      # Extract the population criteria and population collections
      pop_helper = HQMF2::DocumentPopulationHelper.new(@entry, @doc, self, @id_generator, @reference_ids)
      @populations, @population_criteria = pop_helper.extract_populations_and_criteria

      # Remove any data criteria from the main data criteria list that already has an equivalent member
      #  and no references to it. The goal of this is to remove any data criteria that should not
      #  be purely a source.
      @data_criteria.reject! do |dc|
        criteria_covered_by_criteria?(dc)
      end
    end

    # Get the title of the measure
    # @return [String] the title
    def title
      @doc.at_xpath('cda:QualityMeasureDocument/cda:title/@value', NAMESPACES).inner_text
    end

    # Get the description of the measure
    # @return [String] the description
    def description
      description = @doc.at_xpath('cda:QualityMeasureDocument/cda:text/@value', NAMESPACES)
      description.nil? ? '' : description.inner_text
    end

    # Get all the population criteria defined by the measure
    # @return [Array] an array of HQMF2::PopulationCriteria
    def all_population_criteria
      @population_criteria
    end

    # Get a specific population criteria by id.
    # @param [String] id the population identifier
    # @return [HQMF2::PopulationCriteria] the matching criteria, raises an Exception if not found
    def population_criteria(id)
      find(@population_criteria, :id, id)
    end

    # Get all the data criteria defined by the measure
    # @return [Array] an array of HQMF2::DataCriteria describing the data elements used by the measure
    def all_data_criteria
      @data_criteria
    end

    # Get a specific data criteria by id.
    # @param [String] id the data criteria identifier
    # @return [HQMF2::DataCriteria] the matching data criteria, raises an Exception if not found
    def data_criteria(id)
      find(@data_criteria, :id, id)
    end

    # Adds data criteria to the Document's criteria list
    # needed so data criteria can be added to a document from other objects
    def add_data_criteria(dc)
      @data_criteria << dc
    end

    # Finds a data criteria by it's local variable name
    def find_criteria_by_lvn(local_variable_name)
      find(@data_criteria, :local_variable_name, local_variable_name)
    end

    # Get ids of data criteria directly referenced by others
    # @return [Array] an array of ids of directly referenced data criteria
    def all_reference_ids
      @reference_ids
    end

    # Adds id of a data criteria to the list of reference ids
    def add_reference_id(id)
      @reference_ids << id
    end

    # Parse an XML document from the supplied contents
    # @return [Nokogiri::XML::Document]
    def self.parse(hqmf_contents)
      doc = hqmf_contents.is_a?(Nokogiri::XML::Document) ? hqmf_contents : Nokogiri::XML(hqmf_contents)
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      doc
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      dcs = all_data_criteria.collect(&:to_model)
      pcs = all_population_criteria.collect(&:to_model)
      sdc = source_data_criteria.collect(&:to_model)
      HQMF::Document.new(@id, @id, @hqmf_set_id, @hqmf_version_number, @cms_id,
                         title, description, pcs, dcs, sdc,
                         @attributes, @measure_period, @populations)
    end

    # Finds an element within the collection given that has an instance variable or method of "attribute" with a value
    # of "value"
    def find(collection, attribute, value)
      collection.find { |e| e.send(attribute) == value }
    end

    private

    # Handles setup of the base values of the document, defined here as ones that are either
    #  obtained from the xml directly or with limited parsing
    def setup_default_values(hqmf_contents, use_default_measure_period)
      @id_generator = IdGenerator.new
      @doc = @entry = Document.parse(hqmf_contents)

      @id = attr_val('cda:QualityMeasureDocument/cda:id/@extension') ||
            attr_val('cda:QualityMeasureDocument/cda:id/@root').upcase
      @hqmf_set_id = attr_val('cda:QualityMeasureDocument/cda:setId/@extension') ||
                     attr_val('cda:QualityMeasureDocument/cda:setId/@root').upcase
      @hqmf_version_number = attr_val('cda:QualityMeasureDocument/cda:versionNumber/@value')

      # TODO: -- figure out if this is the correct thing to do -- probably not, but is
      # necessary to get the bonnie comparison to work.  Currently
      # defaulting measure period to a period of 1 year from 2012 to 2013 this is overriden during
      # calculation with correct year information .  Need to investigate parsing mp from meaures.
      @measure_period = extract_measure_period_or_default(use_default_measure_period)

      # Extract measure attributes
      # TODO: Review
      @attributes = @doc.xpath('/cda:QualityMeasureDocument/cda:subjectOf/cda:measureAttribute', NAMESPACES)
                    .collect do |attribute|
        read_attribute(attribute)
      end

      @data_criteria = []
      @source_data_criteria = []
      @data_criteria_references = {}
      @occurrences_map = {}

      # Used to keep track of referenced data criteria ids
      @reference_ids = []
    end

    # Extracts a measure period from the document or returns the default measure period
    #  (if the default value is set to true).
    def extract_measure_period_or_default(default)
      if default
        mp_low = HQMF::Value.new('TS', nil, '201201010000', nil, nil, nil)
        mp_high = HQMF::Value.new('TS', nil, '201212312359', nil, nil, nil)
        mp_width = HQMF::Value.new('PQ', 'a', '1', nil, nil, nil)
        HQMF::EffectiveTime.new(mp_low, mp_high, mp_width)
      else
        measure_period_def = @doc.at_xpath('cda:QualityMeasureDocument/cda:controlVariable/cda:measurePeriod/cda:value',
                                           NAMESPACES)
        EffectiveTime.new(measure_period_def).to_model if measure_period_def
      end
    end

    # Handles parsing the attributes of the document
    def read_attribute(attribute)
      id = attribute.at_xpath('./cda:id/@root', NAMESPACES).try(:value)
      code = attribute.at_xpath('./cda:code/@code', NAMESPACES).try(:value)
      name = attribute.at_xpath('./cda:code/cda:displayName/@value', NAMESPACES).try(:value)
      value = attribute.at_xpath('./cda:value/@value', NAMESPACES).try(:value)

      id_obj = nil
      if attribute.at_xpath('./cda:id', NAMESPACES)
        id_obj = HQMF::Identifier.new(attribute.at_xpath('./cda:id/@xsi:type', NAMESPACES).try(:value),
                                      id,
                                      attribute.at_xpath('./cda:id/@extension', NAMESPACES).try(:value))
      end

      code_obj = nil
      if attribute.at_xpath('./cda:code', NAMESPACES)
        code_obj, null_flavor, o_text = handle_attribute_code(attribute, code, name)

        # Mapping for nil values to align with 1.0 parsing
        code = null_flavor if code.nil?
        name = o_text if name.nil?

      end

      value_obj = nil
      value_obj = handle_attribute_value(attribute, value) if attribute.at_xpath('./cda:value', NAMESPACES)

      # Handle the cms_id
      @cms_id = "CMS#{value}v#{@hqmf_version_number.to_i}" if name.include? 'eMeasure Identifier'

      HQMF::Attribute.new(id, code, value, nil, name, id_obj, code_obj, value_obj)
    end

    # Extracts the code used by a particular attribute
    def handle_attribute_code(attribute, code, name)
      null_flavor = attribute.at_xpath('./cda:code/@nullFlavor', NAMESPACES).try(:value)
      o_text = attribute.at_xpath('./cda:code/cda:originalText/@value', NAMESPACES).try(:value)
      code_obj = HQMF::Coded.new(attribute.at_xpath('./cda:code/@xsi:type', NAMESPACES).try(:value) || 'CD',
                                 attribute.at_xpath('./cda:code/@codeSystem', NAMESPACES).try(:value),
                                 code,
                                 attribute.at_xpath('./cda:code/@valueSet', NAMESPACES).try(:value),
                                 name,
                                 null_flavor,
                                 o_text)
      [code_obj, null_flavor, o_text]
    end

    # Extracts the value used by a particular attribute
    def handle_attribute_value(attribute, value)
      type = attribute.at_xpath('./cda:value/@xsi:type', NAMESPACES).try(:value)
      case type
      when 'II'
        if value.nil?
          value = attribute.at_xpath('./cda:value/@extension', NAMESPACES).try(:value)
        end
        HQMF::Identifier.new(type,
                             attribute.at_xpath('./cda:value/@root', NAMESPACES).try(:value),
                             attribute.at_xpath('./cda:value/@extension', NAMESPACES).try(:value))
      when 'ED'
        HQMF::ED.new(type, value, attribute.at_xpath('./cda:value/@mediaType', NAMESPACES).try(:value))
      when 'CD'
        HQMF::Coded.new('CD',
                        attribute.at_xpath('./cda:value/@codeSystem', NAMESPACES).try(:value),
                        attribute.at_xpath('./cda:value/@code', NAMESPACES).try(:value),
                        attribute.at_xpath('./cda:value/@valueSet', NAMESPACES).try(:value),
                        attribute.at_xpath('./cda:value/cda:displayName/@value', NAMESPACES).try(:value))
      else
        value.present? ? HQMF::GenericValueContainer.new(type, value) : HQMF::AnyValue.new(type)
      end
    end

    def extract_criteria
      # Extract the data criteria
      extracted_criteria = []
      @doc.xpath('cda:QualityMeasureDocument/cda:component/cda:dataCriteriaSection/cda:entry', NAMESPACES)
        .each do |entry|
        extracted_criteria << entry
      end

      # Extract the source data criteria from data criteria
      @source_data_criteria, collapsed_source_data_criteria = SourceDataCriteriaHelper.get_source_data_criteria_list(
        extracted_criteria, @data_criteria_references, @occurrences_map)

      extracted_criteria.each do |entry|
        criteria = DataCriteria.new(entry, @data_criteria_references, @occurrences_map)
        handle_data_criteria(criteria, collapsed_source_data_criteria)
        @data_criteria << criteria
      end
    end

    def handle_data_criteria(criteria, collapsed_source_data_criteria)
      # Sometimes there are multiple criteria with the same ID, even though they're different; in the HQMF
      # criteria refer to parent criteria via outboundRelationship, using an extension (aka ID) and a root;
      # we use just the extension to follow the reference, and build the lookup hash using that; since they
      # can repeat, we wind up overwriting some content. This becomes important when we want, for example,
      # the code_list_id and we overwrite the parent with the code_list_id with a child with the same ID
      # without the code_list_id. As a temporary approach, we only overwrite a data criteria reference if
      # it doesn't have a code_list_id. As a longer term approach we may want to use the root for lookups.
      if criteria && (@data_criteria_references[criteria.id].try(:code_list_id).nil?)
        @data_criteria_references[criteria.id] = criteria
      end
      if collapsed_source_data_criteria.key?(criteria.id)
        candidate = find(all_data_criteria, :id, collapsed_source_data_criteria[criteria.id])
        # derived criteria should not be collapsed... they do not have enough info to be collapsed and may cross into the wrong criteria
        # only add the collapsed as a source for derived if it is stripped of any temporal references, fields, etc. to make sure we don't cross into an incorrect source
        if ((criteria.definition != 'derived') || (!candidate.nil? && SourceDataCriteriaHelper.already_stripped?(candidate)))
          criteria.instance_variable_set(:@source_data_criteria, collapsed_source_data_criteria[criteria.id])
        end
      end

      handle_variable(criteria, collapsed_source_data_criteria) if criteria.variable
      handle_specific_source_data_criteria_reference(criteria)
      @reference_ids.concat(criteria.children_criteria)
      if criteria.temporal_references
        criteria.temporal_references.each do |tr|
          @reference_ids << tr.reference.id if tr.reference.id != HQMF::Document::MEASURE_PERIOD_ID
        end
      end
    end
    
    # For specific occurrence data criteria, make sure the source data criteria reference points
    # to the correct source data criteria.
    def handle_specific_source_data_criteria_reference(criteria)
      original_sdc = find(@source_data_criteria, :id, criteria.source_data_criteria)
      updated_sdc = find(@source_data_criteria, :id, criteria.id)
      if !updated_sdc.nil? && !criteria.specific_occurrence.nil? && (original_sdc.nil? || original_sdc.specific_occurrence.nil?)
        criteria.instance_variable_set(:@source_data_criteria, criteria.id)
      end
      return if original_sdc.nil?
      if (criteria.specific_occurrence && !original_sdc.specific_occurrence)
        original_sdc.instance_variable_set(:@specific_occurrence, criteria.specific_occurrence)
        original_sdc.instance_variable_set(:@specific_occurrence_const, criteria.specific_occurrence_const)
        original_sdc.instance_variable_set(:@code_list_id, criteria.code_list_id)
      end
    end
    
  end
end
