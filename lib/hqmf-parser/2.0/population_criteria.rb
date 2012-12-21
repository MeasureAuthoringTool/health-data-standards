module HQMF2
  # Represents an HQMF population criteria, also supports all the same methods as
  # HQMF2::Precondition
  class PopulationCriteria
  
    include HQMF2::Utilities
    
    attr_reader :preconditions, :id, :hqmf_id, :title, :type
    
    # Create a new population criteria from the supplied HQMF entry
    # @param [Nokogiri::XML::Element] the HQMF entry
    def initialize(entry, doc)
      @doc = doc
      @entry = entry
      @hqmf_id = attr_val('./*/cda:id/@extension')
      @title = attr_val('./*/cda:code/cda:displayName/@value') 
      @type = attr_val('./*/cda:code/@code')
      @preconditions = @entry.xpath('./*/cda:precondition[not(@nullFlavor)]', HQMF2::Document::NAMESPACES).collect do |precondition|
        Precondition.new(precondition, @doc)
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
      when HQMF::PopulationCriteria::IPP, HQMF::PopulationCriteria::DENOM, HQMF::PopulationCriteria::NUMER
        HQMF::Precondition::ALL_TRUE
      when HQMF::PopulationCriteria::DENEXCEP, HQMF::PopulationCriteria::DENEX
        HQMF::Precondition::AT_LEAST_ONE_TRUE
      else
        raise "Unknown population type [#{@type}]"
      end
    end
    
    def to_model
      mps = preconditions.collect {|p| p.to_model}
      HQMF::PopulationCriteria.new(id, hqmf_id, type, mps, title)
    end

  end
  
end