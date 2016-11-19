module HQMF2
  # Represents an HQMF population criteria, also supports all the same methods as
  # HQMF2::Precondition
  class PopulationCriteria
    include HQMF2::Utilities

    attr_reader :preconditions, :id, :hqmf_id, :title, :aggregator, :comments
    # need to do this to allow for setting the type to OBSERV for
    attr_accessor :type
    # Create a new population criteria from the supplied HQMF entry
    # @param [Nokogiri::XML::Element] the HQMF entry
    def initialize(entry, doc, id_generator)
      @id_generator = id_generator
      @doc = doc
      @entry = entry
      setup_derived_entry_elements(id_generator)
      # modify type to meet current expected population names
      @type = 'IPP' if @type == 'IPOP' || @type == 'IPPOP'
      @comments = nil if comments.empty?
      # MEAN is handled in current code. Changed since it should have the same effect
      @aggregator = 'MEAN' if @aggregator == 'AVERAGE'
      @hqmf_id = @type unless @hqmf_id # The id extension is not required, if it's not provided use the code
      handle_type(id_generator)
    end

    # Handles how the code should deal with the type definition (aggregate vs non-aggregate)
    def handle_type(id_generator)
      if @type != 'AGGREGATE'
        # Generate the precondition for this population
        if @preconditions.length > 1 ||
           (@preconditions.length == 1 && @preconditions[0].conjunction != conjunction_code)
          @preconditions = [Precondition.new(id_generator.next_id, conjunction_code, @preconditions)]
        end
      else
        # Extract the data criteria this population references
        dc = handle_observation_criteria
        @preconditions = [Precondition.new(id_generator.next_id, nil, nil, false, HQMF2::Reference.new(dc.id))]
      end
    end

    # Handles extracting elements from the entry
    def setup_derived_entry_elements(id_generator)
      @hqmf_id = attr_val('./*/cda:id/@root') || attr_val('./*/cda:typeId/@extension')
      @title = attr_val('./*/cda:code/cda:displayName/@value').try(:titleize)
      @type = attr_val('./*/cda:code/@code')
      @comments = @entry.xpath('./*/cda:text/cda:xml/cda:qdmUserComments/cda:item/text()', HQMF2::Document::NAMESPACES)
                  .map(&:content)
      handle_preconditions(id_generator)
      obs_test = attr_val('./cda:measureObservationDefinition/@classCode')
      # If there are no measure observations, or there is a title, then there are no aggregations to extract
      return unless !@title && obs_test.to_s == 'OBS'
      @title = attr_val('../cda:code/cda:displayName/@value')
      @aggregator = attr_val('./cda:measureObservationDefinition/cda:methodCode/cda:item/@code')
    end

    # specifically handles extracting the preconditions for the population criteria
    def handle_preconditions(id_generator)
      # Nest multiple preconditions under a single root precondition
      @preconditions = @entry.xpath('./*/cda:precondition[not(@nullFlavor)]', HQMF2::Document::NAMESPACES)
                       .collect do |pre|
        precondition = Precondition.parse(pre, @doc, id_generator)
        precondition.reference.nil? && precondition.preconditions.empty? ? nil : precondition
      end
      # Remove uneeded nils from the array
      @preconditions.compact!
    end

    # extracts out any measure observation definitons, creating from them the proper criteria to generate a precondition
    def handle_observation_criteria
      exp = @entry.at_xpath('./cda:measureObservationDefinition/cda:value/cda:expression/@value',
                            HQMF2::Document::NAMESPACES)
      # Measure Observations criteria rely on computed expressions. If it doesn't have one,
      #  then it is likely formatted improperly.
      fail 'Measure Observations criteria is missing computed expression(s) ' if exp.nil?
      parts = exp.to_s.split('-')
      dc = parse_parts_to_dc(parts)
      @doc.add_data_criteria(dc)
      dc
    end

    # generates the value given in an expression based on the number of criteria it references.
    def parse_parts_to_dc(parts)
      case parts.length
      when 1
        # If there is only one part, it is a reference to an existing data criteria's value
        @doc.find_criteria_by_lvn(parts.first.strip.split('.')[0])
      when 2
        # If there are two parts, there is a computation performed, specifically time difference, on the two criteria
        children = parts.collect { |p| @doc.find_criteria_by_lvn(p.strip.split('.')[0]).id }
        id = "GROUP_TIMEDIFF_#{@id_generator.next_id}"
        HQMF2::DataCriteriaWrapper.new(id: id,
                                       title: id,
                                       subset_operators: [HQMF::SubsetOperator.new('DATETIMEDIFF', nil)],
                                       children_criteria: children,
                                       derivation_operator: HQMF::DataCriteria::XPRODUCT,
                                       type: 'derived',
                                       definition: 'derived',
                                       negation: false,
                                       source_data_criteria: id
                                      )
      else
        # If there are neither one or 2 parts, the code should fail
        fail "No defined extraction method to handle #{parts.length} parts"
      end
    end

    def create_human_readable_id(id)
      @id = id
    end

    # Get the conjunction code, ALL_TRUE or AT_LEAST_ONE_TRUE
    # @return [String] conjunction code
    def conjunction_code
      case @type
      when HQMF::PopulationCriteria::IPP, HQMF::PopulationCriteria::DENOM, HQMF::PopulationCriteria::NUMER,
           HQMF::PopulationCriteria::MSRPOPL, HQMF::PopulationCriteria::STRAT
        HQMF::Precondition::ALL_TRUE
      when HQMF::PopulationCriteria::DENEXCEP, HQMF::PopulationCriteria::DENEX, HQMF::PopulationCriteria::MSRPOPLEX,
           HQMF::PopulationCriteria::NUMEX
        HQMF::Precondition::AT_LEAST_ONE_TRUE
      else
        fail "Unknown population type [#{@type}]"
      end
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      mps = preconditions.collect(&:to_model)
      HQMF::PopulationCriteria.new(id, hqmf_id, type, mps, title, aggregator, comments)
    end
  end
end
