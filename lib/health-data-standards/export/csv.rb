module HealthDataStandards
  module Export
    module CommaSV
      # Builds a CSV row representing the patient.
      #
      # @return csv representation of patient data
      def export(patient,header)
      
       
        csv = header ? [generate_header,extract_patient_data(patient)] : extract_patient_data(patient)           
      
       
      end
      
      def generate_header
        ["patient_id", "first name", "last name", "gender","race","ethnicity","birthdate"]
      end
      
      def extract_patient_data(patient)
        race = ''
        ethnicity = ''
        race = patient.race['name'] || patient.race if !patient.race.nil?
        ethnicity = patient.ethnicity['name'] || patient.ethnicity if !patient.ethnicity.nil?
        
       [patient.patient_id, patient.first, patient.last, patient.gender, race, ethnicity, Time.at(patient.birthdate).strftime('%m/%d/%Y')]
      end

      extend self
    
    end
  end
end