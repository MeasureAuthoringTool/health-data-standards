module HQMF
  # Class for converting an HQMF 1.0 representation to an HQMF 2.0 representation
  class PopulationCriteriaConverter
    
    attr_reader :sub_measures
    
    def initialize(doc, data_criteria_converter)
      @doc = doc
      @data_criteria_converter = data_criteria_converter
      @population_criteria_by_id = {}
      @population_criteria_by_key = {}
      @population_reference = {}
      parse()
      build_sub_measures()
    end
    
    def population_criteria
      @population_criteria_by_key.values
    end
    
    private 
    
    def build_sub_measures()
      @sub_measures = []
      ipps = @population_criteria_by_id.select {|key, value| value.type == HQMF::PopulationCriteria::IPP}
      denoms = @population_criteria_by_id.select {|key, value| value.type == HQMF::PopulationCriteria::DENOM}
      nums = @population_criteria_by_id.select {|key, value| value.type == HQMF::PopulationCriteria::NUMER}
      msrpopls = @population_criteria_by_id.select {|key, value| value.type == HQMF::PopulationCriteria::MSRPOPL}
      observs = @population_criteria_by_id.select {|key, value| value.type == HQMF::PopulationCriteria::OBSERV}
      excls = @population_criteria_by_id.select {|key, value| value.type == HQMF::PopulationCriteria::DENEX}
      denexcs = @population_criteria_by_id.select {|key, value| value.type == HQMF::PopulationCriteria::DENEXCEP}
      
      if (ipps.size<=1 and denoms.size<=1 and nums.size<=1 and excls.size<=1 and denexcs.size<=1 and msrpopls.size<=1 and observs.size<=1 )
        sub_measure = {}
          
        sub_measure[HQMF::PopulationCriteria::IPP] = HQMF::PopulationCriteria::IPP if ipps.size > 0
        sub_measure[HQMF::PopulationCriteria::DENOM] = HQMF::PopulationCriteria::DENOM if denoms.size > 0
        sub_measure[HQMF::PopulationCriteria::NUMER] = HQMF::PopulationCriteria::NUMER if nums.size > 0
        sub_measure[HQMF::PopulationCriteria::DENEXCEP] = HQMF::PopulationCriteria::DENEXCEP if denexcs.size > 0
        sub_measure[HQMF::PopulationCriteria::DENEX] = HQMF::PopulationCriteria::DENEX if excls.size > 0
        sub_measure[HQMF::PopulationCriteria::MSRPOPL] = HQMF::PopulationCriteria::MSRPOPL if msrpopls.size > 0
        sub_measure[HQMF::PopulationCriteria::OBSERV] = HQMF::PopulationCriteria::OBSERV if observs.size > 0
          
        @sub_measures << sub_measure
      else

        nums.each do |num_id, num|
          @sub_measures << {HQMF::PopulationCriteria::NUMER => num.id}
        end
        msrpopls.each do |popl_id, popl|
          @sub_measures << {HQMF::PopulationCriteria::MSRPOPL => popl.id}
        end
        apply_to_submeasures(@sub_measures, HQMF::PopulationCriteria::DENOM, denoms.values)
        apply_to_submeasures(@sub_measures, HQMF::PopulationCriteria::IPP, ipps.values)
        
        apply_to_submeasures(@sub_measures, HQMF::PopulationCriteria::DENEX, excls.values, HQMF::PopulationCriteria::IPP,  get_unmatched_population_keys(ipps, excls))
        apply_to_submeasures(@sub_measures, HQMF::PopulationCriteria::DENEXCEP, denexcs.values, HQMF::PopulationCriteria::DENOM,  get_unmatched_population_keys(denoms, denexcs))

        apply_to_submeasures(@sub_measures, HQMF::PopulationCriteria::OBSERV, observs.values)
        
        keep = []
        
        @sub_measures.each do |sub|
          
          value = sub
          HQMF::PopulationCriteria::ALL_POPULATION_CODES.each do |type|
            key = sub[type]
            if (key)
              reference_id = @population_reference[key]
              reference = @population_criteria_by_id[reference_id] if reference_id
              if (reference)
                criteria = @population_criteria_by_key[sub[reference.type]]
                value['stratification'] = criteria.stratification_id if criteria.stratification_id
                value = nil if (sub[reference.type] != reference.id and criteria.stratification_id.nil?)
              end
            end
          end
          keep << value if (value)
        end
        
        keep.each_with_index do |sub, i|
          sub['title'] = "Population #{i+1}"
          sub['id'] = "Population#{i+1}"
        end
        
        @sub_measures = keep
        
      end
    end
    
    # source are things like exceptions or exclusions, target are IPP, or denom
    # we want to find any denoms or IPPs that do not have exceptions or exclusions
    def get_unmatched_population_keys(target, source)
      return [] if target.length == source.length
      all_target_keys = target.values.map(&:id)
      with_ref_keys = source.values.map(&:id).map {|key| @population_criteria_by_id[@population_reference[key]].id if @population_criteria_by_id[@population_reference[key]]}
      # if we have a population without a reference, we cannot trust the results.
      return [] if with_ref_keys.include? nil
      all_target_keys - with_ref_keys
    end
    
    # create a copy of each submeasre adding on the new values of the given type
    # skip the unpaired values.  Unpaired values are denominators without exclusions or populations without exceptions
    def apply_to_submeasures(subs, type, values, unpaired_type=nil, unpaired_keys=[])
      new_subs = []
      subs.each do |sub|
        # this unless prevents us from forcing an exclusion or excepion onto a measure that has a submeasure without 
        # an exclusion or exception, but other populations with an exclusion or excepion.
        unless unpaired_keys.include? sub[unpaired_type]
          # duplicate each new value if it is set, otherwise set this key on each submeasure.
          values.each do |value|
            if (sub[type] and sub[type] != value.id)
              tmp = {}
              HQMF::PopulationCriteria::ALL_POPULATION_CODES.each do |key|
                tmp[key] = sub[key] if sub[key]
              end
              sub = tmp
              new_subs << sub
            end
            sub[type] = value.id
          end
        end
      end
      subs.concat(new_subs)
    end
    
    def find_sub_measures(type, value)
      found = []
      @sub_measures.each do |sub_measure|
        found << sub_measure if sub_measure[type] and sub_measure[type] == value.id
      end
      found
    end

    def parse
      @doc[:logic].each do |key,criteria|
        @population_criteria_by_key[key] = convert(key.to_s, criteria)
      end
    end
   
    def convert(key, population_criteria)
      
      # @param [String] id
      # @param [Array#Precondition] preconditions 
      
      preconditions = HQMF::PreconditionConverter.parse_preconditions(population_criteria[:preconditions],@data_criteria_converter) 
      hqmf_id = population_criteria[:hqmf_id] || population_criteria[:id]
      id = population_criteria[:id]
      type = population_criteria[:code]
      reference = population_criteria[:reference]
      title = population_criteria[:title]

      criteria = HQMF::Converter::SimplePopulationCriteria.new(key, hqmf_id, type, preconditions, title)
      # mark the 2.0 simple population criteria as a stratification... this allows us to create the cartesian product for this in the populations
      criteria.stratification_id = population_criteria[:stratification_id]
      
      @population_criteria_by_id[id] = criteria
      @population_reference[key] = reference
      
      criteria
     
    end
   
  end  
end
