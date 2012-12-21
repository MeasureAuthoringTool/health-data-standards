module HQMF
  # Class for converting an HQMF 1.0 representation to an HQMF 2.0 representation
  class ComparisonConverter
    
    def initialize(data_criteria_converter)
      @data_criteria_converter = data_criteria_converter
    end
   
   def convert_comparisons(population_criteria)
     population_criteria.each do |population|
       walk_up_tree(population.preconditions)
     end
   end
   
   def walk_up_tree(preconditions)
     preconditions.each do |precondition|
       if (has_child_comparison(precondition))
         walk_up_tree(precondition.preconditions)
       end
       if (precondition.comparison? && !precondition.processed)
         new_data_criteria = nil
         # duplicate the data criteria referenced by the comparision (unless it's the measurement period. we don't modify the measurement period)
         if precondition.reference and precondition.reference.id != HQMF::Document::MEASURE_PERIOD_ID
           data_criteria = @data_criteria_converter.v2_data_criteria_by_id[precondition.reference.id] 
           new_data_criteria = @data_criteria_converter.duplicate_data_criteria(data_criteria, precondition.id)
           precondition.reference.id = new_data_criteria.id
         end
         # add restrictions to the duplicated data criteria
         if precondition.has_preconditions?
           restrictions = precondition.restrictions
           # we want to process summary operators first since they can create new data criteria
           restrictions.sort! {|left, right| (right.operator.summary? and !left.operator.summary?) ? 1 : 0 }
           restrictions.each do |restriction|
             operator = restriction.operator
             # check if the data criteria has been changed by either a grouping addition or an operator
             if (precondition.reference and (new_data_criteria == nil or new_data_criteria.id != precondition.reference.id))
               new_data_criteria = @data_criteria_converter.v2_data_criteria_by_id[precondition.reference.id] 
             end
             if (operator.temporal?)
               HQMF::OperatorConverter.apply_temporal(new_data_criteria, precondition, restriction, @data_criteria_converter)
             elsif(operator.summary?)
               HQMF::OperatorConverter.apply_summary(new_data_criteria, precondition, restriction, @data_criteria_converter)
             else
               case operator.type
               when 'REFR'
                 if operator.field.downcase == 'status'
                   # only set the status if we don't have one.  We trust the template ID statuses more than the restrictions
                   new_data_criteria.status ||= operator.value.code
                 elsif operator.field.downcase == 'result value' or operator.field.downcase == 'result'
                   puts "\tREFR result value is nil: #{new_data_criteria.title}" if (operator.value.nil?)
                   new_data_criteria.value = operator.value
                 else
                   new_data_criteria.field_values ||= {}
                   new_data_criteria.field_values[operator.field_value_key] = operator.value
                 end
                 restriction.converted=true
               when 'RSON'
                 new_data_criteria.negation_code_list_id = operator.value.code_list_id
                 new_data_criteria.negation=true
                 restriction.converted=true
               when 'SUBJ'
                 new_data_criteria.field_values ||= {}
                 new_data_criteria.field_values[operator.field_value_key] = operator.value
                 restriction.converted=true
               else
                 puts "\tOperator is unknown: #{operator.type}"
                 restriction.converted=true
               end
             end
           end
           precondition.delete_converted_restrictions!
           precondition.processed = true
         end
       end
     end
   end
   
   def has_child_comparison(node)
     value = false
     node.preconditions.each do |precondition|
       if (precondition.comparison?)
         value ||= true
       elsif precondition.has_preconditions?
         value ||= has_child_comparison(precondition)
       end
     end if node.preconditions
     value
   end

  end  
end
