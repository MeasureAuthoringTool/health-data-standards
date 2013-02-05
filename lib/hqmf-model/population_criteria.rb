module HQMF
  # Represents an HQMF population criteria, also supports all the same methods as
  # HQMF::Precondition
  class PopulationCriteria
  
    include HQMF::Conversion::Utilities

    attr_reader :preconditions, :id, :type, :title, :hqmf_id
    attr_accessor :aggregator
    
    IPP = 'IPP'
    DENOM = 'DENOM'
    NUMER = 'NUMER'
    DENEXCEP = 'DENEXCEP'
    DENEX = 'DENEX'
    MSRPOPL = 'MSRPOPL'
    OBSERV = 'OBSERV'
    
    ALL_POPULATION_CODES = [IPP, DENOM, NUMER, DENEXCEP, DENEX, MSRPOPL, OBSERV]
    
    # Create a new population criteria
    # @param [String] id
    # @param [String] hqmf_id
    # @param [Array#Precondition] preconditions 
    # @param [String] title (optional)
    def initialize(id, hqmf_id, type, preconditions, title='', aggregator=nil)
      @id = id
      @hqmf_id = hqmf_id
      @preconditions = preconditions
      @type = type
      @title = title
      @aggregator = aggregator
    end
    
    # Create a new population criteria from a JSON hash keyed off symbols
    def self.from_json(id, json)
      preconditions = json["preconditions"].map do |precondition|
        HQMF::Precondition.from_json(precondition)
      end if json['preconditions']
      type = json["type"]
      title = json['title']
      hqmf_id = json['hqmf_id']
      aggregator = json['aggregator']
      
      HQMF::PopulationCriteria.new(id, hqmf_id, type, preconditions, title, aggregator)
    end
    
    def to_json
      {self.id.to_sym => base_json}
    end
    
    def base_json
      x = nil
      json = build_hash(self, [:conjunction?, :type, :title, :hqmf_id, :aggregator])
      json[:preconditions] = x if x = json_array(@preconditions)
      json
    end
    
    # Return true of this precondition represents a conjunction with nested preconditions
    # or false of this precondition is a reference to a data criteria
    # if it is an observation population criteria, then it is not a conjunction, it is instead doing a calculation
    def conjunction?
      type != HQMF::PopulationCriteria::OBSERV
    end

    # Get the conjunction code, e.g. allTrue, atLeastOneTrue
    # @return [String] conjunction code
    def conjunction_code
      
      case @type
      when IPP, DENOM, NUMER, MSRPOPL
        HQMF::Precondition::ALL_TRUE
      when DENEXCEP, DENEX
        HQMF::Precondition::AT_LEAST_ONE_TRUE
      else
        raise "Unknown population type [#{@type}]"
      end
      
    end
    
    # Can't have negation on population so this is the same as conjunction_code
    def conjunction_code_with_negation
      conjunction_code
    end
    
    def referenced_data_criteria
      data_criteria_ids = []
      @preconditions.each do |precondition|
        data_criteria_ids.concat(precondition.referenced_data_criteria)
      end if @preconditions
      data_criteria_ids
    end
    
  end
  
end