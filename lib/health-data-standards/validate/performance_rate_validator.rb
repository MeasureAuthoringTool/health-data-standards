require_relative "reported_result_extractor"
module HealthDataStandards
  module Validate
  class PerformanceRateValidator
    include ReportedResultExtractor
    include BaseValidator
    

    def initialize()


    
    end

    # Nothing to see here - Move along
    def validate(file, data = {})
      errorsList = []
      document = get_document(file)
      #grab measure IDs from QRDA file
      measure_ids = document.xpath(measure_selector).map(&:value).map(&:upcase)
      measure_ids.each do |measure_id|
        measures = HealthDataStandards::CQM::Measure.where(id: measure_id)
        measures.each do |measure|
          result_key = measure["population_ids"].dup
          reported_result, errors = extract_results_by_ids(measure['id'], result_key, document)
          #only check performace rate when there is one
          if reported_result['PR'] != nil
            error = check_performance_rates(reported_result, result_key, measure['id'], data)
            if error != nil
              errorsList << error
            end
          end
        end
      end
      errorsList
    end

    def calculate_performance_rates(reported_result)
      #Just in case a measure does not report these populations
      denex = 0
      denexcep = 0
      denom = 0
      numer = 0
      if reported_result['DENEX'] != nil
        denex = reported_result['DENEX']
      end
      if reported_result['DENEXCEP'] != nil
        denexcep = reported_result['DENEXCEP']
      end
      if reported_result['DENOM'] != nil
        denom = reported_result['DENOM']
      end
      if reported_result['NUMER'] != nil
        numer = reported_result['NUMER']
      end
      denom = denom -  denex - denexcep
      pr = 0
      if denom == 0
        pr = "NA"
      else
        pr = numer / denom.to_f
      end
      return pr
    end

    def check_performance_rates(reported_result, population_ids, measure_id, data = {})
      expected = calculate_performance_rates(reported_result)
      _ids = population_ids
      if expected == "NA"
        if reported_result['PR']['nullFlavor'] != "NA"
          return build_error("Reported Performance Rate for Numerator #{_ids['NUMER']} should be NA", "/", data[:file_name])
        end
      else
        if reported_result['PR']['nullFlavor'] == "NA"
          return build_error("Reported Performance Rate for Numerator #{_ids['NUMER']} should not be NA", "/", data[:file_name])
        else
          if (reported_result['PR']['value'].split('.',2).last.size > 6)
            return build_error("Reported Performance Rate SHALL not have a precision greater than .000001 ", "/", data[:file_name])
          elsif (reported_result['PR']['value'].to_f - expected.round(6)).abs > 0.0000001
            return build_error("Reported Performance Rate of #{reported_result['PR']['value']} for Numerator #{_ids['NUMER']} does not match expected value of #{expected.to_s[0,8]}.", "/", data[:file_name])
          end
        end
      end
    end

    def measure_selector
  "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section/cda:entry" +
  "/cda:organizer[./cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference[@typeCode='REFR']" +
        "/cda:externalDocument[@classCode='DOC']/cda:id[@root='2.16.840.1.113883.4.738']/@extension"
    end

    end
  end
end