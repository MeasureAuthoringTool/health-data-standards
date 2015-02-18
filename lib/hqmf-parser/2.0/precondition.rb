module HQMF2

  class Precondition

    include HQMF2::Utilities

    attr_reader :preconditions, :reference, :conjunction


    def self.parse(entry, doc, population_criteria_type=nil)
      doc = doc
      entry = entry
      negation = false
      aggregation = entry.at_xpath('./cda:allTrue | ./cda:atLeastOneTrue | ./cda:allFalse | ./cda:atLeastOneFalse', HQMF2::Document::NAMESPACES)
      conjuntion = nil 
      preconditions = []
      if aggregation
        precondition_entries = entry.xpath('./*/cda:precondition', HQMF2::Document::NAMESPACES)
        preconditions = precondition_entries.collect do |precondition|
         Precondition.parse(precondition, doc)
        end
        conjunction = aggregation.name
        case conjunction
          when "allFalse"
          negation = true
          conjunction = "atLeastOneTrue"
          when "atLeastOneFalse"
          negation = true
          conjunction = "allTrue"
        else
        end

      end

      reference_def = entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES)
      if !reference_def
        reference_def = entry.at_xpath('./cda:join/cda:templateId/cda:item', HQMF2::Document::NAMESPACES)
      end
      if reference_def
        reference = Reference.new(reference_def)
      end
      self.new(conjunction,preconditions,negation,reference)
    end

    def initialize(conjunction,preconditions=[],negation=false,reference=nil)
      @preconditions=preconditions
      @conjunction = conjunction
      @reference = reference
      @negation = negation
    end



    def to_model
      pcs = @preconditions.collect {|p| p.to_model}
      mr = @reference ? @reference.to_model : nil
      cc = @conjunction
      HQMF::Precondition.new(nil, pcs, mr, cc, @negation)
    end
  end

end
