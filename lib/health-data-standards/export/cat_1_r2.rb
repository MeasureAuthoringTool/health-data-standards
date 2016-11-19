# require_relative 'cat_1'

module HealthDataStandards
  module Export
    class Cat1R2 < Cat1
      def export(patient, measures, start_date, end_date, header=nil, qrda_version=nil, cms_compatibility=false)
      	# QRDA version is always 'r2'
        super(patient, measures, start_date, end_date, header, 'r2', cms_compatibility)
      end
    end
  end
end