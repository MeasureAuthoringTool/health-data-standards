module HQMF2
  # Represents an HQMF population criteria, also supports all the same methods as
  # HQMF2::Precondition
  class PopulationCriteria

    include HQMF2::Utilities

    attr_reader :preconditions, :id, :hqmf_id, :title, :aggregator, :comments
    #need to do this to allow for setting the type to OBSERV for
    attr_accessor :type
    # Create a new population criteria from the supplied HQMF entry
    # @param [Nokogiri::XML::Element] the HQMF entry
    def initialize(entry, doc, id_generator)
      @id_generator = id_generator
      @doc = doc
      @entry = entry
      @hqmf_id = attr_val('./*/cda:id/@root') || attr_val('./*/cda:typeId/@extension')
      @title = attr_val('./*/cda:code/cda:displayName/@value')
      @type = attr_val('./*/cda:code/@code')
      @type = 'IPP' if ( @type == 'IPOP' || @type == 'IPPOP' )
      @aggregator = nil
      @comments = @entry.xpath("./*/cda:text/cda:xml/cda:qdmUserComments/cda:item/text()", HQMF2::Document::NAMESPACES)
                        .map{ |v| v.content }
      obs_test = attr_val('./cda:measureObservationDefinition/@classCode')
      if !@title && obs_test.to_s == "OBS"
          @title = attr_val('../cda:code/cda:displayName/@value')
          @aggregator = attr_val('./cda:measureObservationDefinition/cda:methodCode/cda:item/@code')
      end
      if(!@hqmf_id) # The id extension is not required, if it's not provided use the code
        @hqmf_id = @type
      end

      # Nest multiple preconditions under a single root precondition
      @preconditions = @entry.xpath('./*/cda:precondition[not(@nullFlavor)]', HQMF2::Document::NAMESPACES).collect do |pre|
        Precondition.parse(pre,@doc,id_generator)
      end
      if @type != "AGGREGATE"
        if @preconditions.length > 1 ||
           ( @preconditions.length == 1 && @preconditions[0].conjunction != conjunction_code)
          @preconditions = [Precondition.new(id_generator.next_id,conjunction_code, @preconditions)]
        end
      else
        dc = handle_observation_critiera
        @preconditions = [Precondition.new(id_generator.next_id,nil, nil, false, HQMF2::Reference.new(dc.id))]
      end
    end


    def handle_observation_critiera
 
      exp = @entry.at_xpath("./cda:measureObservationDefinition/cda:value/cda:expression/@value", HQMF2::Document::NAMESPACES)
      raise "No Expression " if exp.nil?

      parts = exp.to_s.split("-") 
      if parts.length != 2
        raise "Has an error here :: todo make more descriptive"
      end
      children = parts.collect{|p| @doc.find_criteria_by_lvn(p.strip.split(".")[0]).id}
      _id ="GROUP_TIMEDIFF_#{ @id_generator.next_id}"
      dc = HQMF2::DataCriteriaWrapper.new(id: _id, 
                                          title: _id ,
                                          subset_operators: [HQMF::SubsetOperator.new("TIMEDIFF", HQMF::AnyValue.new("ANYNonNull"))],
                                          children_criteria: children,
                                          derivation_operator: HQMF::DataCriteria::XPRODUCT,
                                          type: "derived" ,
                                          definition: "derived" ,
                                          negation: false,
                                          source_data_criteria: _id,
                                           )
      @doc.add_data_criteria(dc)
      dc

    end

    def create_human_readable_id(id)
      @id = id
    end

    # Return true of this precondition represents a conjunction with nested preconditions
    # or false of this precondition is a reference to a data criteria
    def conjunction?
      true
    end

    # Get the conjunction code, e.g. allTrue, allFalse
    # @return [String] conjunction code
    def conjunction_code
      case @type
      when HQMF::PopulationCriteria::IPP, HQMF::PopulationCriteria::DENOM, HQMF::PopulationCriteria::NUMER,HQMF::PopulationCriteria::MSRPOPL,HQMF::PopulationCriteria::STRAT
        HQMF::Precondition::ALL_TRUE
      when HQMF::PopulationCriteria::DENEXCEP, HQMF::PopulationCriteria::DENEX, HQMF::PopulationCriteria::MSRPOPLEX
        HQMF::Precondition::AT_LEAST_ONE_TRUE
      else
        raise "Unknown population type [#{@type}]"
      end
    end

    def to_model
      mps = preconditions.collect {|p| p.to_model}
      HQMF::PopulationCriteria.new(id, hqmf_id, type, mps, title, aggregator, comments)
    end

  end

end
