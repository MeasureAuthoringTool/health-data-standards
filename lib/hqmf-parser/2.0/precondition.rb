module HQMF2
  
  class Precondition
  
    include HQMF2::Utilities
    
    attr_reader :preconditions, :reference
  
    def initialize(entry, doc)
      @doc = doc
      @entry = entry
      @preconditions = @entry.xpath('./*/cda:precondition', HQMF2::Document::NAMESPACES).collect do |precondition|
        Precondition.new(precondition, @doc)
      end
      reference_def = @entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES)
      if reference_def
        @reference = Reference.new(reference_def)
      end
    end
    
    # Return true of this precondition represents a conjunction with nested preconditions
    # or false of this precondition is a reference to a data criteria
    def conjunction?
      @preconditions.length>0
    end
    
    # Get the conjunction code, e.g. allTrue, allFalse
    # @return [String] conjunction code
    def conjunction_code
      if conjunction?
        @entry.at_xpath('./*[1]', HQMF2::Document::NAMESPACES).name
      else
        nil
      end
    end
    
    def to_model
      pcs = preconditions.collect {|p| p.to_model}
      mr = reference ? reference.to_model : nil
      HQMF::Precondition.new(nil, pcs, mr, conjunction_code, false)
    end
  end
    
end