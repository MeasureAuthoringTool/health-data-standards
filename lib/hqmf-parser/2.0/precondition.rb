module HQMF2

  class Precondition

    include HQMF2::Utilities

    attr_reader :preconditions, :reference

    def initialize(entry, doc, population_criteria_type=nil)
      @doc = doc
      @entry = entry
      @negation = false
      precondition_entries = @entry.xpath('./*/cda:precondition', HQMF2::Document::NAMESPACES)
      precondition_entries = @entry.xpath('cda:precondition', HQMF2::Document::NAMESPACES) unless !precondition_entries.blank?
      @preconditions = precondition_entries.collect do |precondition|
        Precondition.new(precondition, @doc)
      end

      reference_def = @entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES)
      if !reference_def
        reference_def = @entry.at_xpath('./cda:join/cda:templateId/cda:item', HQMF2::Document::NAMESPACES)
      end
      if reference_def
        @reference = Reference.new(reference_def)
      end
      if population_criteria_type
        @conj = case population_criteria_type
          when "STRAT", "IPP", "DENOM", "NUMER", "MSRPOPL" then "allTrue"
          when "DENEXCEP", "DENEX", "NUMEX", "MSRPOPLEX" then "atLeastOneTrue"
        end
      end
    end

    # Return true of this precondition represents a conjunction with nested preconditions
    # or false of this precondition is a reference to a data criteria
    def conjunction?
      @preconditions.length>0
    end

    # Get the conjunction code, e.g. allTrue, allFalse
    # @return [String] conjunction code
    #allFalse -> negated atLeastOneTrue
    #atLeastOneFalse -> negated allTrue
    def conjunction_code
      if conjunction?
        conj = @entry.at_xpath('./*[1]', HQMF2::Document::NAMESPACES).name
        case conj
        when "allFalse"
          @negation = true
          "atLeastOneTrue"
        when "atLeastOneFalse"
          @negation = true
          "allTrue"
        else
          @negation = false
          @conj || conj
        end
      else
        nil
      end
    end

    def to_model
      pcs = preconditions.collect {|p| p.to_model}
      mr = reference ? reference.to_model : nil
      cc = @conj || conjunction_code
      HQMF::Precondition.new(nil, pcs, mr, cc, @negation)
    end
  end

end
