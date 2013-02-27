module HQMF
  
  class Precondition

    include HQMF::Conversion::Utilities
    
    AT_LEAST_ONE_TRUE = 'atLeastOneTrue'
    AT_LEAST_ONE_FALSE = 'atLeastOneFalse'
    ALL_TRUE = 'allTrue'
    ALL_FALSE = 'allFalse'
    NEGATIONS = {
      AT_LEAST_ONE_TRUE => ALL_FALSE,
      ALL_FALSE => AT_LEAST_ONE_TRUE,
      ALL_TRUE => AT_LEAST_ONE_FALSE,
      AT_LEAST_ONE_FALSE => ALL_TRUE
    }
    INVERSIONS = {
      AT_LEAST_ONE_TRUE => ALL_TRUE,
      ALL_FALSE => AT_LEAST_ONE_FALSE,
      ALL_TRUE => AT_LEAST_ONE_TRUE,
      AT_LEAST_ONE_FALSE => ALL_FALSE
    }
    
    attr_reader :id, :preconditions, :reference, :conjunction_code
    attr_accessor :negation
  
    # Create a new population criteria
    # @param [Array#Precondition] preconditions 
    # @param [Reference] reference
    # @param [String] conjunction_code
    def initialize(id, preconditions, reference, conjunction_code, negation)
      @preconditions = preconditions || []
      @reference = reference
      @conjunction_code = conjunction_code
      @negation = negation
      @id = id
    end
    
    def conjunction_code_with_negation
      if negation
        NEGATIONS[conjunction_code]
      else
        conjunction_code
      end
    end
    
    # Create a new population criteria from a JSON hash keyed off symbols
    def self.from_json(json)
      preconditions = []
      id = json["id"] if json["id"]
      preconditions = json["preconditions"].map {|precondition| HQMF::Precondition.from_json(precondition)} if json["preconditions"]
      reference = Reference.new(json["reference"]) if json["reference"] 
      conjunction_code = json["conjunction_code"] if json["conjunction_code"]
      negation = json["negation"] if json["negation"]
      
      HQMF::Precondition.new(id, preconditions, reference, conjunction_code, negation)
    end
    
    def to_json
      x = nil
      json = {}
      json[:id] = self.id
      json[:reference] = self.reference.id if self.reference
      json[:preconditions] = x if x = json_array(@preconditions)
      json[:conjunction_code] = self.conjunction_code if self.conjunction_code
      json[:negation] = self.negation if self.negation
      json
    end
    
    # Return true of this precondition represents a conjunction with nested preconditions
    # or false of this precondition is a reference to a data criteria
    def conjunction?
      @preconditions.length>0
    end

    def referenced_data_criteria
      data_criteria_ids = []
      if @preconditions.empty?
        data_criteria_ids << self.reference.id
      else
        @preconditions.each do |precondition|
          data_criteria_ids.concat(precondition.referenced_data_criteria)
        end
      end
      data_criteria_ids
    end

  end
  
  
end