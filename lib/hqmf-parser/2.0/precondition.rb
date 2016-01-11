module HQMF2
  # Represents the logic that defines grouping of criteria and actions done on it.
  class Precondition
    include HQMF2::Utilities

    attr_reader :preconditions, :reference, :conjunction, :id

    def self.parse(entry, doc, id_generator)
      doc = doc
      entry = entry
      aggregation = entry.at_xpath('./cda:allTrue | ./cda:atLeastOneTrue | ./cda:allFalse | ./cda:atLeastOneFalse',
                                   HQMF2::Document::NAMESPACES)

      # Sets the reference criteria for the precondition (if it exists)
      reference_def = entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES)
      reference_def ||= entry.at_xpath('./cda:join/cda:templateId/cda:item', HQMF2::Document::NAMESPACES)
      reference = Reference.new(reference_def) if reference_def

      # Unless there is an aggregator, no further actions are necessary.
      return new(id_generator.next_id, nil, [], false, reference) unless aggregation

      precondition_entries = entry.xpath('./*/cda:precondition', HQMF2::Document::NAMESPACES)
      preconditions = precondition_entries.collect do |precondition|
        precondition = Precondition.parse(precondition, doc, id_generator)
        # There are cases where a precondition may contain no references or preconditions, and should be ignored.
        precondition.reference.nil? && precondition.preconditions.empty? ? nil : precondition
      end
      preconditions.compact!
      handle_aggregation(id_generator, reference, preconditions, aggregation)
    end

    # "False" aggregators exist, and require special handling, so this manages that and returns the
    #   proper precondition.
    def self.handle_aggregation(id_generator, reference, preconditions, aggregation, conjunction = nil)
      negation = false
      conjunction = aggregation.name
      case conjunction
      # DeMorgan's law is used to handle negated caes: e.g. to find if all are false, negate the "at least one true"
      # check.
      when 'allFalse'
        negation = true
        conjunction = 'atLeastOneTrue'
      when 'atLeastOneFalse'
        negation = true
        conjunction = 'allTrue'
      end
      # Return the proper precondition given if a negation exists
      if negation
        # Wrap the negation in a seperate precondition which this will reference
        precondition_wrapper = new(id_generator.next_id, conjunction, preconditions, true, reference)
        new(id_generator.next_id, conjunction, [precondition_wrapper])
      else
        new(id_generator.next_id, conjunction, preconditions, false, reference)
      end
    end

    def initialize(id, conjunction, preconditions = [], negation = false, reference = nil)
      @preconditions = preconditions || []
      @conjunction = conjunction
      @reference = reference
      @negation = negation
      @id = id
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      pcs = @preconditions.collect(&:to_model)
      mr = @reference ? @reference.to_model : nil
      cc = @conjunction
      HQMF::Precondition.new(@id, pcs, mr, cc, @negation)
    end
  end
end
