require_relative 'validation_error'
require_relative 'base_validator'
require_relative 'schema_validator'
require_relative 'schematron_validator'
require_relative 'measure_validator'
require_relative 'data_validator'
require_relative 'performance_rate_validator'

module HealthDataStandards
  module Validate

    CDA_SDTC_SCHEMA = 'resources/schema/infrastructure/cda/CDA_SDTC.xsd'
    QRDA_CAT1_SCHEMATRON = 'resources/schematron/qrda/cat_1_r2/QRDA Category I Release 2.sch'
    QRDA_CAT1_R3_SCHEMATRON = 'resources/schematron/qrda/cat_1/CDAR2_QRDA_I_R1_D3_2015MAY_Schematron.sch'
    QRDA_CAT3_SCHEMATRON = 'resources/schematron/qrda/cat_3/QRDA Category III.sch'
    BASE_DIR = File.expand_path("../../../../", __FILE__)

    class Cat1Measure < MeasureValidator
      include Singleton

      def initialize()
        super("2.16.840.1.113883.10.20.24.3.97")
      end

    end

    class Cat3Measure < MeasureValidator
      include Singleton

      def initialize()
        super("2.16.840.1.113883.10.20.27.3.1")
      end

    end

    class CDA < Schema::Validator
      include Singleton

      def initialize
        super("CDA SDTC Validator", File.join(BASE_DIR, CDA_SDTC_SCHEMA))
      end

    end

    class Cat1 < Schematron::Validator
      include Singleton

      def initialize
	super("QRDA Cat 1 R3 Validator", File.join(BASE_DIR, QRDA_CAT1_R3_SCHEMATRON))
      end

    end

    class Cat1R2 < Schematron::Validator
      include Singleton

      def initialize
        super("QRDA Cat 1 Validator", File.join(BASE_DIR, QRDA_CAT1_SCHEMATRON))
      end

    end

    class Cat3 < Schematron::Validator
      include Singleton

      def initialize
        super("QRDA Cat 3 Validator", File.join(BASE_DIR, QRDA_CAT3_SCHEMATRON))
      end
    end

    class Cat3PerformanceRate < PerformanceRateValidator
      include Singleton

      #def initialize
      #  super("Performance Rate Validator", File.join(BASE_DIR, CDA_SDTC_SCHEMA))
      #end

    end
  end
end
