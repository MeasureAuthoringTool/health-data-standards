module QME

  module MapReduce

    # Computes the value of quality measures based on the current set of patient
    # records in the database
    class Executor

      include DatabaseAccess

      # Create a new Executor for a specific measure, effective date and patient population.
      # @param [String] measure_id the measure identifier
      # @param [String] sub_id the measure sub-identifier or null if the measure is single numerator
      # @param [Hash] parameter_values a hash that may contain the following keys: 'effective_date' the measurement period end date, 'test_id' an identifier for a specific set of patients
      def initialize(measure_id, sub_id, parameter_values)
        @measure_id = measure_id
        @sub_id = sub_id
        @parameter_values = parameter_values
        determine_connection_information
      end

      # Examines the patient_cache collection and generates a total of all groups
      # for the measure. The totals are placed in a document in the query_cache
      # collection.
      # @return [Hash] measure groups (like numerator) as keys, counts as values
      def count_records_in_measure_groups
        patient_cache = get_db.collection('patient_cache')
        query = {'value.measure_id' => @measure_id, 'value.sub_id' => @sub_id,
                 'value.effective_date' => @parameter_values['effective_date'],
                 'value.test_id' => @parameter_values['test_id']}
        result = {:measure_id => @measure_id, :sub_id => @sub_id, 
                  :effective_date => @parameter_values['effective_date'],
                  :test_id => @parameter_values['test_id']}
        %w(population denominator numerator antinumerator exclusions).each do |measure_group|
          patient_cache.find(query.merge("value.#{measure_group}" => true)) do |cursor|
            result[measure_group] = cursor.count
          end
        end
        get_db.collection("query_cache").save(result)
        result
      end

      # This method runs the MapReduce job for the measure which will create documents
      # in the patient_cache collection. These documents will state the measure groups
      # that the record belongs to, such as numerator, etc.
      def map_records_into_measure_groups
        qm = QualityMeasure.new(@measure_id, @sub_id)
        measure = Builder.new(get_db, qm.definition, @parameter_values)
        records = get_db.collection('records')
        records.map_reduce(measure.map_function, "function(key, values){return values;}",
                           :out => {:reduce => 'patient_cache'}, 
                           :finalize => measure.finalize_function,
                           :query => {:test_id => @parameter_values['test_id']})
      end
    end
  end
end
