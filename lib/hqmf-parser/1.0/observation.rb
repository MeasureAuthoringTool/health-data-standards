module HQMF1
  # Represents an HQMF population criteria
  class Observation
  
    include HQMF1::Utilities
    
    attr_reader :preconditions, :entry, :doc
    attr_accessor :id, :hqmf_id, :stratification_id
    
    # Create a new population criteria from the supplied HQMF entry
    # @param [Nokogiri::XML::Element] the HQMF entry
    def initialize(entry, doc)
      @doc = doc
      @entry = entry
      @id = attr_val('cda:observation/cda:id/@root').upcase
      @preconditions = [Precondition.new(@entry, nil, @doc)]
    end
    
    # Get the code for the population criteria
    # @return [String] the code (e.g. IPP, DEMON, NUMER, DENEX, DENEXCEP)
    def code
      HQMF::PopulationCriteria::OBSERV
    end
    
    # Get the id for the population criteria, used elsewhere in the HQMF document to
    # refer to this criteria
    # @return [String] the id
    def id
      @id
    end
    
    def title
      "Measure Observation"
    end
    
    def reference
      nil
    end
    
    def to_json
      
      json = {}
      self.preconditions.compact.each do |precondition| 
        json[:preconditions] ||= []
        json[:preconditions] << precondition.to_json
      end
      json[:preconditions].each {|p| p[:conjunction] ||= "AND"}
      
      json[:id] = id
      json[:title] = title
      json[:code] = code
      json[:hqmf_id] = hqmf_id if hqmf_id
      json[:stratification_id] = stratification_id if stratification_id
      json[:reference] = reference
      
      {self.code => json}
      
    end
    
  end
end