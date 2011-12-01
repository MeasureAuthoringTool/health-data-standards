module HealthDataStandards
  module Export
    module CommaSV
      # Builds a CSV row representing the patient.
      #
      # @return csv representation of patient data
      def export(patient,header)
      
       
       csv_string = header ? [["row", "of", "CSV", "data"],["another", "row"]] : ["another", "row"]                   
        
             
      
       
      end

      extend self
    
    end
  end
end