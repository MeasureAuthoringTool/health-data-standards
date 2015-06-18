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
      @errors = []
      @document = get_document(file)
      #grab measure IDs from QRDA file
      measure_ids = @document.xpath(measure_selector).map(&:value).map(&:upcase)
      measure_ids.each do |measure_id|
        measures = HealthDataStandards::CQM::Measure.where(id: measure_id)
        measures.each do |measure|
          result_key = measure["population_ids"].dup
          reported_result, errors = extract_results_by_ids(measure['id'], result_key)
          check_performance_rates(reported_result, result_key, measure['id'], data)
        end
      end
      @errors
    end

    def calculate_performance_rates(reported_result)
      denex = 0
      denexcep = 0
      if reported_result['DENEX'] != nil
        denex = reported_result['DENEX']
      end
      if reported_result['DENEXCEP'] != nil
        denexcep = reported_result['DENEXCEP']
      end
      denom = reported_result['DENOM'] -  denex - denexcep
      pr = 0
      if denom == 0
        pr = "NA"
      else
        pr = reported_result['NUMER'] / denom.to_f
      end
      return pr
    end

    def check_performance_rates(reported_result, population_ids, measure_id, data = {})
      expected = calculate_performance_rates(reported_result)
      _ids = population_ids
      if expected == "NA"
        if reported_result['PR']['nullFlavor'] != "NA"
          #err = "Reported Performance Rate for Numerator #{_ids['NUMER']} should be NA"
          #logger.call(err, _ids['NUMER'])
          @errors << build_error("Reported Performance Rate for Numerator #{_ids['NUMER']} should be NA", "/", data[:file_name])
        end
      else
        if reported_result['PR']['nullFlavor'] == "NA"
          #err = "Reported Performance Rate for Numerator #{_ids['NUMER']} should not be NA"
          #logger.call(err, _ids['NUMER'])
          @errors << build_error("Reported Performance Rate for Numerator #{_ids['NUMER']} should not be NA", "/", data[:file_name])
        else 
          if reported_result['PR']['value'].to_f - expected.to_f > 0.000001
            #err = "Reported Performance Rate of #{reported_result['PR']['value']} for Numerator #{_ids['NUMER']} does not match expected value of #{expected}."
            #logger.call(err, _ids['NUMER'])
            @errors << build_error("Reported Performance Rate of #{reported_result['PR']['value']} for Numerator #{_ids['NUMER']} does not match expected value of #{expected}.", "/", data[:file_name])
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