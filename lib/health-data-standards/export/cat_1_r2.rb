# require_relative 'cat_1'

module HealthDataStandards
  module Export
    class Cat1R2 < Cat1
      def export(patient, measures, start_date, end_date, header=nil, r2_compatibiliy=true, cms_compatibility=false)
        super(patient, measures, start_date, end_date, header, r2_compatibiliy, cms_compatibility)
      end
    end
  end
end