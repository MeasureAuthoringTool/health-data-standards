module HQMF2
  # Contains extraction methods which are self-contained (rely only on the xml and an xpath, no other instance
  # variables)
  class DataCriteriaBaseExtractions
    include HQMF2::Utilities
    CONJUNCTION_CODE_TO_DERIVATION_OP = {
      'OR' => 'UNION',
      'AND' => 'XPRODUCT'
    }

    def initialize(entry)
      @entry = entry
    end

    # Extract the local variable name (held in the value of the localVariableName element)
    def extract_local_variable_name
      lvn = @entry.at_xpath('./cda:localVariableName')
      lvn['value'] if lvn
    end

    # Generate a list of child criterias
    def extract_child_criteria
      @entry.xpath("./*/cda:outboundRelationship[@typeCode='COMP']/cda:criteriaReference/cda:id",
                   HQMF2::Document::NAMESPACES).collect do |ref|
        Reference.new(ref).id
      end.compact
    end

    # Extracts the derivation operator to be used by the data criteria, and fails out if it finds more than one (should
    # not be valid)
    def extract_derivation_operator
      codes = @entry.xpath("./*/cda:outboundRelationship[@typeCode='COMP']/cda:conjunctionCode/@code",
                           HQMF2::Document::NAMESPACES)
      codes.inject(nil) do |d_op, code|
        if d_op && d_op != CONJUNCTION_CODE_TO_DERIVATION_OP[code.value]
          fail 'More than one derivation operator in data criteria'
        end
        CONJUNCTION_CODE_TO_DERIVATION_OP[code.value]
      end
    end

    def extract_temporal_references
      @entry.xpath('./*/cda:temporallyRelatedInformation', HQMF2::Document::NAMESPACES).collect do |temporal_reference|
        TemporalReference.new(temporal_reference)
      end
    end

    # Filters all the subset operators to only include the ones of type 'UNION' and 'XPRODUCT'
    def extract_subset_operators
      all_subset_operators.select do |operator|
        operator.type != 'UNION' && operator.type != 'XPRODUCT'
      end
    end

    # Extracts all subset operators contained in the entry xml
    def all_subset_operators
      @entry.xpath('./*/cda:excerpt', HQMF2::Document::NAMESPACES).collect do |subset_operator|
        SubsetOperator.new(subset_operator)
      end
    end

    def extract_template_ids
      @entry.xpath('./*/cda:templateId/cda:item', HQMF2::Document::NAMESPACES).collect do |template_def|
        HQMF2::Utilities.attr_val(template_def, '@root')
      end
    end

    # Extract the negation (and the negation_code_list_id if appropriate)
    def extract_negation
      negation = (attr_val('./*/@actionNegationInd') == 'true')
      negation_code_list_id = nil
      if negation
        res = @entry.at_xpath('./*/cda:outboundRelationship/*/cda:code[@code="410666004"]/../cda:value/@valueSet',
                              HQMF2::Document::NAMESPACES)
        negation_code_list_id = res.value if res
      end
      [negation, negation_code_list_id]
    end
  end
end
