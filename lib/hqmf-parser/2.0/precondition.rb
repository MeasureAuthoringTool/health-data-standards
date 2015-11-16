module HQMF2

  class Precondition

    include HQMF2::Utilities

    attr_reader :preconditions, :reference, :conjunction,:id


    def self.parse(entry, doc, id_generator)
      doc = doc
      entry = entry
      negation = false
      aggregation = entry.at_xpath('./cda:allTrue | ./cda:atLeastOneTrue | ./cda:allFalse | ./cda:atLeastOneFalse', HQMF2::Document::NAMESPACES)
      conjunction = nil
      preconditions = []

      reference_def = entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES)
      if !reference_def
        reference_def = entry.at_xpath('./cda:join/cda:templateId/cda:item', HQMF2::Document::NAMESPACES)
      end
      if reference_def
        reference = Reference.new(reference_def)
      end

      if aggregation
        precondition_entries = entry.xpath('./*/cda:precondition', HQMF2::Document::NAMESPACES)
        preconditions = precondition_entries.collect do |precondition|
          precondition = Precondition.parse(precondition, doc, id_generator)
          if precondition.reference.nil? && precondition.preconditions.empty?
            nil
          else
            precondition
          end
        end
        preconditions.compact!
        conjunction = aggregation.name
        case conjunction
        when "allFalse"
          negation = true
          conjunction = "atLeastOneTrue"
          return self.new(id_generator.next_id,"atLeastOneTrue",[self.new(id_generator.next_id,conjunction,preconditions,negation,reference)])
        when "atLeastOneFalse"
          negation = true
          conjunction = "allTrue"
          return self.new(id_generator.next_id,"allTrue",[self.new(id_generator.next_id,conjunction,preconditions,negation,reference)])
        end
      end
      self.new(id_generator.next_id,conjunction,preconditions,negation,reference)
    end

    def initialize(id,conjunction,preconditions=[],negation=false,reference=nil)
      @preconditions=preconditions || []
      @conjunction = conjunction
      @reference = reference
      @negation = negation
      @id = id
    end

    def to_model
      pcs = @preconditions.collect {|p| p.to_model}
      mr = @reference ? @reference.to_model : nil
      cc = @conjunction
      HQMF::Precondition.new(@id, pcs, mr, cc, @negation)
    end
  end

end
