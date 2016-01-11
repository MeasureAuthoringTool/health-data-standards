# require_relative 'cat_1'

module HealthDataStandards
  module Export
    class Cat1R2 < Cat1
      def export(patient, measures, start_date, end_date, header=nil, r2_compatibiliy=true)
        super(patient, measures, start_date, end_date, header, r2_compatibiliy)
      end
    end
  end
end