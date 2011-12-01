module QME
  module MapReduce
    # A Resque job that allows for measure calculation by a Resque worker. Can be created as follows:
    #
    #    MapReduce::MeasureCalculationJob.create(:measure_id => '0221', :sub_id => 'a', :effective_date => 1291352400, :test_id => xyzzy)
    #
    # This will return a uuid which can be used to check in on the status of a job. More details on this can be found
    # at the {Resque Stats project page}[https://github.com/quirkey/resque-status].
    #
    # MeasureCalculationJob will check to see if a measure has been calculated before running the calculation. It does
    # this by creating a QME::QualityReport and asking if it has been calculated. If so, it will complete the job without
    # running the MapReduce job.
    #
    # When a measure needs calculation, the job will create a QME::MapReduce::Executor and interact with it to calculate
    # the report.
    class MeasureCalculationJob < Resque::JobWithStatus
      def perform
        test_id = options['test_id'] ? BSON::ObjectId(options['test_id']) : nil
        qr = QualityReport.new(options['measure_id'], options['sub_id'], 'effective_date' => options['effective_date'], 'test_id' => test_id)
        if qr.calculated?
          completed("#{options['measure_id']}#{options['sub_id']} has already been calculated")
        else
          map = QME::MapReduce::Executor.new(options['measure_id'], options['sub_id'], 'effective_date' => options['effective_date'], 'test_id' => test_id)
          tick('Starting MapReduce')
          map.map_records_into_measure_groups
          tick('MapReduce complete')
          tick('Calculating group totals')
          result = map.count_records_in_measure_groups
          completed("#{options['measure_id']}#{options['sub_id']}: p#{result['population']}, d#{result['denominator']}, n#{result['numerator']}, e#{result['exclusions']}")
        end
      end
    end
  end
end