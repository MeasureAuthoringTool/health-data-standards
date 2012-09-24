module HealthDataStandards
  module Export
    module CCR
      # Builds a CCR XML document representing the patient.
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def export(patient)
        xml = Builder::XmlMarkup.new(:indent => 2)
        xml.ContinuityOfCareRecord("xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
                                   "xsi:schemaLocation" => "urn:astm-org:CCR CCR_20051109.xsd http://www.w3.org/2001/XMLSchema xmldsig-core-schema.xsd",
                                   "xmlns" => "urn:astm-org:CCR") do
          xml.CCRDocumentObjectID(patient.id)
          xml.Language do
            xml.Text("English")
          end
          xml.Version("V1.0")
          xml.DateTime do
            #TODO: Need to fix this and not be a hard-coded value
            xml.ExactDateTime(Time.now.xmlschema)
          end
          xml.Patient do 
            xml.ActorID(patient.id)
          end
          xml.From do
            xml.ActorLink do
              xml.ActorID("AA0002")
            end
          end
          to_ccr_purpose(xml)
          xml.Body do
            
            to_ccr_problems(xml, patient)
            to_ccr_socialhistory(xml, patient)
            to_ccr_allergies(xml, patient)
            
            to_ccr_medications(xml, patient)
            to_ccr_immunizations(xml, patient)
            to_ccr_vitals(xml, patient)
            to_ccr_results(xml, patient) 
            to_ccr_procedures(xml, patient)
            to_ccr_encounters(xml, patient)   
          end
          to_ccr_actors(xml, patient)
        end
      end

      extend self

      private

      def code_section(xml, codes)
        if codes.present?
          codes.each_pair do |code_set, coded_values|
            coded_values.each do |coded_value|
              xml.Code do
                xml.Value(coded_value)
                xml.CodingSystem(code_set)
                #TODO: Need to fix this and not be a hard-coded value
                xml.Version("2005")
              end
            end
          end
        end
      end

      def active_status_and_source(xml, patient)
        xml.Status do
          xml.Text("Active")
        end
        xml.Source do
          xml.Actor do
            xml.ActorID(patient.id)
          end
        end
      end


      # Builds the XML snippet for the problems section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_problems(xml, patient)
        if patient.conditions.present?
          xml.Problems do
            patient.conditions.each_with_index do |condition, index|
              xml.Problem do
                xml.CCRDataObjectID("PR000#{index + 1}")
                to_ccr_date(xml, condition.as_point_in_time, "Start date")
                xml.Type do
                  #TODO: Need to fix this and not be a hard-coded value
                  xml.Text("Diagnosis")
                end
                xml.Description do
                  xml.Text(condition.description)
                  code_section(xml, condition.codes)
                end
                active_status_and_source(xml, patient)
              end
            end
          end
        end
      end

      # Builds the XML snippet for the encounters section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_encounters(xml, patient)
        if patient.encounters.present?
          xml.Encounters do
            patient.encounters.each_with_index do |encounter, index|
              xml.Encounter do
                xml.CCRDataObjectID("EN000#{index + 1}")
                to_ccr_date(xml, encounter.as_point_in_time, "Encounter Date")
                xml.Description do
                  xml.Text(encounter.description)
                  code_section(xml, encounter.codes)
                end
                active_status_and_source(xml, patient)
              end
            end
          end
        end
      end

      # Builds the XML snippet for the vitals section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_vitals(xml, patient)
        if patient.vital_signs.present?
          xml.VitalSigns do
            patient.vital_signs.each_with_index do |vital_sign, index|
              to_result(xml,vital_sign,"VT000#{index + 1}")
            end
          end
        end
      end


      # Builds the XML snippet for the lab section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_results(xml, patient)
        if patient.results.present?
          xml.Results do
            patient.results.each_with_index do |lab_result, index|
              to_result(xml,lab_result,"LB000#{index + 1}")
            end
          end
        end
      end
      

      def to_result(xml, res, ccr_id )
        xml.Result do
          xml.CCRDataObjectID(ccr_id)
          to_ccr_date(xml, res.as_point_in_time, "Start date")       
          xml.Source
          xml.Test do
            xml.CCRDataObjectID("#{ccr_id}TestResult")
            xml.Description do
              xml.Text(res.description)
              code_section(xml, res.codes)
            end

            xml.Source
            xml.TestResult do
              rv = res.values.first
              if rv.present? && rv.respond_to?(:scalar)
                xml.Value(rv.scalar)
                xml.Unit do
                  xml.Unit(rv.units)
                end
              else
                
              end
            end
          end
        end     
      end
     
      # Builds the XML snippet for the medications section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_medications(xml, patient)
        if patient.medications.present?
          xml.Medications do
            patient.medications.each_with_index do |medication, index|
              xml.Medication do
                xml.CCRDataObjectID("MD000#{index + 1}")
                to_ccr_date(xml, medication.as_point_in_time, "Prescription Date")  
                xml.Type do
                  xml.Text("Medication")
                end
                active_status_and_source(xml, patient)
                xml.Product do
                  xml.ProductName do
                    xml.Text(medication.description)
                  end
                  xml.BrandName do
                    xml.Text(medication.description)
                    code_section(xml, medication.codes)
                  end
                end
              end
            end
          end
        end
      end

      # Builds the XML snippet for the medications section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_immunizations(xml, patient)
        if patient.immunizations.present?
          xml.Immunizations do
            patient.immunizations.each_with_index do |immunization, index|
              xml.Immunization do
                xml.CCRDataObjectID("IM000#{index + 1}")
                to_ccr_date(xml, immunization.as_point_in_time, "Prescription Date")  
                xml.Type do
                  xml.Text("Immunization")
                end
                active_status_and_source(xml, patient)
                xml.Product do
                  xml.ProductName do
                    xml.Text(immunization.description)
                  end
                  xml.BrandName do
                    xml.Text(immunization.description)
                    code_section(xml, immunization.codes)
                  end
                end
              end
            end
          end
        end
      end

      

      # Builds the XML snippet for the procedures section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_procedures(xml, patient)
        if patient.procedures.present?
          xml.Procedures do
            patient.procedures.each_with_index do |procedure, index|
              xml.Procedure do
                xml.CCRDataObjectID("PR000#{index + 1}")
                to_ccr_date(xml, procedure.as_point_in_time, "Service date")  
                xml.Description do
                  xml.Text(procedure.description)
                  code_section(xml, procedure.codes)
                end
                xml.Status do
                  xml.Text("Active")
                end
                xml.Source
              end
            end
          end
        end
      end

      def to_ccr_allergies(xml, patient)
        if patient.allergies.present?
          xml.Alerts do
            patient.allergies.each_with_index do |allergy, index|
              xml.Alert do
                xml.CCRDataObjectID("AL000#{index + 1}")
                to_ccr_date(xml, allergy.as_point_in_time, "Initial Occurrence")  
                xml.Type do
                  xml.Text("Allergy")
                end
                xml.Description do
                  xml.Text(allergy.description)
                  code_section(xml, allergy.codes)
                end
                xml.Status do
                  xml.Text("Current")
                end
                xml.Source
              end
            end
          end
        end
      end
      
      # Builds the XML snippet for the social history section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_socialhistory(xml, patient)
        if patient.social_history.present?
          xml.SocialHistory do
            patient.social_history.each_with_index do |history, index|
              xml.SocialHistoryElement do
                xml.CCRDataObjectID("SH000#{index + 1}")
               
                                    
                  xml.Description do
                    xml.Text(history.description)
                    code_section(xml, history.codes)
                  end
                
                xml.Source
              end
            end
            
              if patient.race
                xml.SocialHistoryElement do
                  xml.CCRDataObjectID("SH000RACE")
                   xml.Type do 
                      xml.Text("Race")
                    end       
                    xml.Description do
                   
                      code_section(xml, {"2.16.840.1.113883.6.238"=>[patient.race["code"]]})
                    end   
                  xml.Source
                end
             end
          
             if patient.ethnicity
                xml.SocialHistoryElement do
                  xml.CCRDataObjectID("SH000ETHICITY")   
                    xml.Type do 
                      xml.Text("Ethnicity")  
                    end                          
                    xml.Description do
                    
                      code_section(xml, {"2.16.840.1.113883.6.238" => [patient.ethnicity["code"]]})
                    end            
                  xml.Source
                end
             end
             
          end
        end
      end

      # Builds the XML snippet for a actors section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_actors(xml, patient)
        xml.Actors do
          xml.Actor do
            xml.ActorObjectID(patient.id)
            xml.Person do
              xml.Name do
                xml.CurrentName do
                  xml.Given(patient.first)
                  xml.Family(patient.last)
                end
              end     
              xml.DateOfBirth do
                xml.ExactDateTime(convert_to_ccr_time_string(patient.birthdate))  
              end

              if (patient.gender)
                xml.Gender do
                  if (patient.gender.upcase == "M")
                    xml.Text("Male")
                  elsif (patient.gender.upcase == "F")
                    xml.Text("Female")
                  else
                    xml.Text("Undifferentiated")
                  end
                end
             end 
            end
             xml.Source
          end
        end
      end

      # Builds the XML snippet for a purpose section inside the CCR standard
      #
      # @return [Builder::XmlMarkup] CCR XML representation of patient data
      def to_ccr_purpose(xml)
        xml.Purpose do
          xml.Description do
            xml.Text("Cypress Test Patient CCR XML Record")
          end
          xml.Indications do
            xml.Indication do
              xml.Source do
                xml.Actor do
                  xml.ActorID("AA0002")
                end
              end
              xml.InternalCCRLink do
                xml.LinkID
              end
            end
          end
        end
      end

      def convert_to_ccr_time_string(time)
          converted_time = Time.at(time).utc
          converted_time.strftime("%Y-%m-%dT%H:%M:%SZ")
      end

      def to_ccr_date(xml, time, type)
        if time
          xml.DateTime do
            xml.Type do
              xml.Text(type)
            end
            #time
            xml.ExactDateTime(convert_to_ccr_time_string(time))
          end
        end
      end

    end
  end
end