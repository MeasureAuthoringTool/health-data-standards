module HQMF1
  # Represents an HQMF population criteria
  class PopulationCriteria
  
    include HQMF1::Utilities
    
    attr_reader :preconditions, :entry, :doc
    attr_accessor :id, :hqmf_id, :stratification_id
    
    # Create a new population criteria from the supplied HQMF entry
    # @param [Nokogiri::XML::Element] the HQMF entry
    def initialize(entry, doc)
      @doc = doc
      @entry = entry
      @id = attr_val('cda:observation/cda:id/@root').upcase
      @preconditions = @entry.xpath('./*/cda:sourceOf[@typeCode="PRCN"]').collect do |entry|
        pc = Precondition.new(entry, nil, @doc)
        if pc.preconditions.length==0 && !pc.comparison && pc.restrictions.length==0
          nil
        else
          pc
        end
      end.compact
    end
    
    # Get the code for the population criteria
    # @return [String] the code (e.g. IPP, DEMON, NUMER, DENEX, DENEXCEP)
    def code
      value = attr_val('cda:observation/cda:value/@code')
      # exclusion population criteria has id of DENOM with actionNegationInd of true
      # special case this to simply handling
      if attr_val('cda:observation/@actionNegationInd')=='true'
        value = HQMF::PopulationCriteria::DENEX
      end
      value.upcase
    end
    
    # Get the id for the population criteria, used elsewhere in the HQMF document to
    # refer to this criteria
    # @return [String] the id
    def id
      @id
    end
    
    def title
      attr_val('cda:observation/cda:value/@displayName')
    end
    
    def reference
      reference = attr_val('./cda:observation/cda:sourceOf[@typeCode="PRCN"]/cda:observation[@classCode="OBS"]/cda:id/@root')
      reference = reference.upcase if reference
      reference
    end
    
    def to_json
      
      json = {}
      self.preconditions.compact.each do |precondition| 
        json[:preconditions] ||= []
        json[:preconditions] << precondition.to_json
      end
      
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