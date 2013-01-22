module HQMF
  # Class for converting an HQMF 1.0 representation to an HQMF 2.0 representation
  class OperatorConverter
    
    def self.apply_temporal(data_criteria, precondition, restriction, data_criteria_converter)
      data_criteria.temporal_references ||= []
      value = restriction.operator.value
      type = restriction.operator.type
      temporal_reference = nil
      if (restriction.single_target?)
        # multiple targets appears to be the result of restrictions with restrictions
        target = restriction.target
        if (restriction.multi_target?)
          found = false
          # restrictions with restrictions can have a target that is modified by the child restrcitons
          restriction.preconditions.each do |precondition|
            if precondition.reference.id.start_with? target
              found = true
              target = precondition.reference.id
            end
          end
          unless found
            puts "\tmultiple targets... need to check this" if restriction.multi_target?
          end
        end
        temporal_reference = HQMF::TemporalReference.new(type, HQMF::Reference.new(target),value)
        data_criteria_converter.validate_not_deleted(target)
      elsif (restriction.multi_target?)
        
        children_criteria = HQMF::DataCriteriaConverter.extract_data_criteria(restriction.preconditions, data_criteria_converter)
        
        if (children_criteria.length == 1)
          target = children_criteria[0].id
          temporal_reference = HQMF::TemporalReference.new(type, HQMF::Reference.new(target),value)
          data_criteria_converter.validate_not_deleted(target)
        else
          parent_id = "GROUP"
          if restriction.generated_data_criteria.nil?
            # we pass in restriction.preconditions here rather than children_criteria because we need to be able to create grouping data criteria for and and or preconditions in a tree
            group_criteria = data_criteria_converter.create_group_data_criteria(restriction.preconditions, "#{type}_CHILDREN", value, parent_id, HQMF::Counter.instance.next, "grouping", "temporal")
            # save the generated grouping criteria so that we can reference it from other locations
            restriction.generated_data_criteria = group_criteria
          else
            # we have already processed this restriction and have a grouping criteria for it.  Take the one we have previously generated
            group_criteria = restriction.generated_data_criteria
          end
          temporal_reference = HQMF::TemporalReference.new(type, HQMF::Reference.new(group_criteria.id), value)
        end
      else
        raise "no target for temporal restriction"
      end
      restriction.converted=true
      
      # add temporal reference to data criteria
      data_criteria.temporal_references << temporal_reference unless data_criteria.has_temporal(temporal_reference)
    end
    
    
    def self.apply_summary(data_criteria, precondition, restriction, data_criteria_converter)
      value = restriction.operator.value
      type = restriction.operator.type
      subset_operator = HQMF::SubsetOperator.new(type, value)

      if (restriction.multi_target?)
        children_criteria = HQMF::DataCriteriaConverter.extract_data_criteria(restriction.preconditions, data_criteria_converter)
        
        data_criteria = nil
        if (children_criteria.length == 1)
          data_criteria = children_criteria[0]
          data_criteria.subset_operators ||= []
          # add subset operator to data criteria
          data_criteria.subset_operators << subset_operator unless data_criteria.has_subset(subset_operator)
        else
          parent_id = "GROUP"
          
          if restriction.generated_data_criteria.nil?
            # we pass in restriction.preconditions here rather than children_criteria because we need to be able to create grouping data criteria for and and or preconditions in a tree
            data_criteria = data_criteria_converter.create_group_data_criteria(restriction.preconditions, type, value, parent_id, HQMF::Counter.instance.next, "grouping", "summary")
            # save the generated grouping criteria so that we can reference it from other locations
            restriction.generated_data_criteria = data_criteria
          else
            # we have already processed this restriction and have a grouping criteria for it.  Take the one we have previously generated
            data_criteria = restriction.generated_data_criteria
          end
          
          data_criteria.subset_operators ||= []
          # add subset operator to data criteria
          data_criteria.subset_operators << subset_operator unless data_criteria.has_subset(subset_operator)
        end
        precondition.reference = HQMF::Reference.new(data_criteria.id)
      elsif (restriction.single_target?)
        subset_operator = HQMF::SubsetOperator.new(type, value)
        data_criteria.subset_operators ||= []
        # add subset operator to data criteria
        data_criteria.subset_operators << subset_operator unless data_criteria.has_subset(subset_operator)
      end
      
      restriction.converted=true
    end
    
  end  
end
