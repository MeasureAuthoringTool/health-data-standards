module QME
  # A class that allows you to create and obtain the results of running a
  # quality measure against a set of patient records.
  class QualityReport
    include DatabaseAccess
    extend DatabaseAccess
    determine_connection_information

    # Gets rid of all calculated QualityReports by dropping the patient_cache
    # and query_cache collections
    def self.destroy_all
      determine_connection_information
      get_db.collection("query_cache").drop
      get_db.collection("patient_cache").drop
    end

    # Creates a new QualityReport
    # @param [String] measure_id value of the measure's id field
    # @param [String] sub_id value of the measure's sub_id field, may be nil 
    #                 for measures with only a single numerator and denominator
    # @param [Hash] parameter_values slots in the measure definition that need to
    #               be filled in and an optional test_id to identify a sub-population.
    def initialize(measure_id, sub_id, parameter_values)
      @measure_id = measure_id
      @sub_id = sub_id
      @parameter_values = parameter_values
      determine_connection_information
    end
    
    # Determines whether the quality report has been calculated for the given
    # measure and parameters
    # @return [true|false]
    def calculated?
      ! result().nil?
    end
    
    # Kicks off a background job to calculate the measure
    # @return a unique id for the measure calculation job
    def calculate
      MapReduce::MeasureCalculationJob.create(:measure_id => @measure_id, :sub_id => @sub_id, 
                                              :effective_date => @parameter_values['effective_date'], 
                                              :test_id => @parameter_values['test_id'])
    end
    
    # Returns the status of a measure calculation job
    # @param job_id the id of the job to check on
    # @return [Hash] containing status information on the measure calculation job
    def status(job_id)
      Resque::Status.get(job_id)
    end
    
    # Gets the result of running a quality measure
    # @return [Hash] measure groups (like numerator) as keys, counts as values or nil if
    #                the measure has not yet been calculated
    def result
      cache = get_db.collection("query_cache")
      query = {:measure_id => @measure_id, :sub_id => @sub_id, 
               :effective_date => @parameter_values['effective_date'],
               :test_id => @parameter_values['test_id']}
      cache.find_one(query)
    end
  end
end