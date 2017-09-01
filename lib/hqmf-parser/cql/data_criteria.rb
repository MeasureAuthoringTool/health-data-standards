module HQMF2CQL
  # Represents a data criteria specification
  class DataCriteria < HQMF2::DataCriteria
    include HQMF2CQL::DataCriteriaPostProcessing, HQMF2CQL::DataCriteriaTypeAndDefinitionExtraction

    # Get the title of the criteria, provides a human readable description
    # @return [String] the title of this data criteria
    def title
      disp_value = attr_val("#{@code_list_xpath}/cda:displayName/@value")
      # Attempt to pull display value from the localVariableName for
      # MAT 5.3+ exports that appear to no longer include displayName for
      # code entries.
      # NOTE: A long term replacement for this and for other portions of the
      # parsing process should involve reaching out to VSAC for oid information
      # pulled from the CQL, and then to use that information while parsing.
      unless disp_value.present?
        # Grab the localVariableName from the XML
        disp_value = attr_val('./cda:localVariableName/@value')
        # Grab everything before the first underscore
        disp_value = disp_value.partition('_').first unless disp_value.nil?
      end
      @title || disp_value || @description || id # allow defined titles to take precedence
    end

    # Generate the title and description used when producing the model
    def retrieve_title_and_description_for_model
      # remove * Value Set from title
      title_match = title.match(/(.*) \w+ [Vv]alue [Ss]et/)
      @title = title_match[1] if title_match && title_match.length > 1
      
      @description = "#{@description}: #{title}"
    end

    # In certain situations it is necessary to have a negated data criterion 
    # copied to a "positive" form.
    def make_criterion_positive
      @negation = false

      # Remove negation from description
      # sometimes "Not Done" used: "Communication: From Provider To Patient, Not Done"
      # should transform to "Communication: From Provider To Patient"
      @description.gsub!(', Not Done', '')
      
      # sometimes just "Not" used: "Encounter, Not Performed"
      # should transform to "Encounter, Performed"
      @description.gsub!(', Not', ',')

      @source_data_criteria = 'Derived from ' + @source_data_criteria
            
      # Looking to remove the word 'Not'.  Using lookahead and lookbehind in the regex
      # criterion.id = criterion.id.gsub(/(?<=[a-z])Not(?=[A-Z])/, '') + '_spoof'
      @id = @id.gsub(/(?<=[a-z])Not(?=[A-Z])/, '') + '_spoofed'

    end
    
  end
end
