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

      @doc = doc
      @entry = entry
      @hqmf_id = attr_val('./*/cda:id/@extension') || attr_val('./*/cda:typeId/@extension')
      @title = attr_val('./*/cda:code/cda:displayName/@value')
      @type = attr_val('./*/cda:code/@code')
      @type = 'IPP' if ( @type == 'IPOP' || @type == 'IPPOP' )
      id_generator = IdGenerator.new()
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
          @precondtions = [Precondition.new(id_generator.next_id,conjunction_code, @preconditions)]
        end
      end
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
      when HQMF::PopulationCriteria::DENEXCEP, HQMF::PopulationCriteria::DENEX
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
