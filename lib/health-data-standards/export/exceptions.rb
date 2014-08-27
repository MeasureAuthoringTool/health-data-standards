module HealthDataStandards
  module Export
    class PatientExportDataCriteriaException < Exception
      attr_reader :patient, :data_criteria, :entries
      def initialize(string, patient, data_criteria, entries)
        @patient = patient
        @data_criteria = data_criteria
        @entries = entries
        super(string)
      end
    end
  end
end
