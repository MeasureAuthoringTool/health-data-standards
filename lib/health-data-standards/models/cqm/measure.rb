module HealthDataStandards
  module CQM
    class Measure
      include Mongoid::Document
      store_in collection: 'measures'
      field :id, type: String
      field :sub_id, type: String
      field :name, type: String
      field :subtitle, type: String
      field :short_subtitle, type: String
      field :hqmf_id, type: String
      field :hqmf_set_id, type: String
      field :hqmf_version_number, type: String
      field :nqf_id, type: String
      field :type, type: String
      field :category, type: String
      field :population_ids , type: Hash
      field :oids, type: Array 

      field :population_criteria, type: Hash
      field :data_criteria, type: Hash, default: {}
      field :source_data_criteria, type: Hash, default: {}
      field :measure_period, type: Hash
      field :measure_attributes, type: Hash
      field :populations, type: Array
      field :preconditions, type: Hash
      field :hqmf_document, type: Hash
      scope :top_level_by_type , ->(type){where({"type"=> type}).any_of({"sub_id" => nil}, {"sub_id" => "a"})}
      scope :top_level , any_of({"sub_id" => nil}, {"sub_id" => "a"})
      scope :order_by_id_sub_id, order_by([["id", :asc],["sub_id", :asc]])

      index({oids: 1})
      index({hqmf_id: 1})
      index({category: 1})
      index({sub_id: 1})
      index({_id: 1, sub_id: 1})

      index "bundle_id" => 1
      
      validates_presence_of :id
      validates_presence_of :name

      def self.categories
        pipeline = []
        pipeline << {'$group' => {_id: "$id", 
                                  name: {"$first" => "$name"},
                                  description: {"$first" => "$description"},
                                  sub_ids: {'$push' => "$sub_id"},
                                  subs: {'$push' => {"sub_id" => "$sub_id", "short_subtitle" => "$short_subtitle"}},
                                  category: {'$first' => "$category"}}}

        pipeline << {'$group' => {_id: "$category",
                                  measures: {'$push' => {"id" => "$_id", 
                                             'name' => "$name",
                                             'description' => "$description",
                                             'subs' => "$subs",
                                             'sub_ids' => "$sub_ids"
                                            }}}}

        pipeline << {'$project' => {'category' => '$_id', 'measures' => 1, '_id' => 0}}
  
        pipeline << {'$sort' => {"category" => 1}}
        Mongoid.default_session.command(aggregate: 'measures', pipeline: pipeline)['result']
      end


      # Returns the hqmf-parser's ruby implementation of an HQMF document.
      # Rebuild from population_criteria, data_criteria, and measure_period JSON
      def as_hqmf_model
        @hqmf ||=  HQMF::Document.from_json(self.hqmf_document)
      end

      def smoking_gun_data(patient_cache_filter={})
        ::Measure.calculate_smoking_gun_data(self["bundle_id"], self.hqmf_id, patient_cache_filter)
      end
      # Calculate the smoking gun data for the given hqmf_id with the given patient_cache_filter
      # The  filter will allow us to segment the cache by things like test_id required for Cypress.

      def self.calculate_smoking_gun_data(bundle_id, hqmf_id, patient_cache_filter={})
        population_keys = ('a'..'zz').to_a
        values = {}
        measure = Measure.top_level.where({hqmf_id: hqmf_id, bundle_id: bundle_id}).first
        sub_ids = []
        hqmf_measure = measure.as_hqmf_model
        population_codes = []
        if  hqmf_measure.populations.length == 1
          sub_ids = nil
          population = hqmf_measure.populations[0]
          HQMF::PopulationCriteria::ALL_POPULATION_CODES.each do |code|
                population_codes <<  population[code] if population[code]
          end
        else 
          #Do not bother with populaions that contain stratifications
          hqmf_measure.populations.each_with_index do |population,index|
            if population["stratification"].nil?
              sub_ids << population_keys[index] 
              HQMF::PopulationCriteria::ALL_POPULATION_CODES.each do |code|
                population_codes <<  population[code] if population[code]
              end
            end
          end
        end

        population_codes.uniq!

        rationals = PatientCache.smoking_gun_rational(measure.hqmf_id,sub_ids,patient_cache_filter)
        rationals.each_pair do |mrn,rash|
          values[mrn] = []
          population_codes.each do |pop_code|
           # if (population[pop_code])
              population_criteria = hqmf_measure.population_criteria(pop_code)
              if population_criteria.preconditions
                array = []
               
                parent = population_criteria.preconditions[0]
                values[mrn].concat self.loop_preconditions(hqmf_measure, parent, rash)
              end # end  population_criteria.preconditions
            #end # end (population[pop_code])
          end # population_codes
          values[mrn].uniq!
        end
        values
      end

      private


      def self.loop_data_criteria(hqmf, data_criteria, rationale)
        result = []
        if (rationale[data_criteria.id])

          if data_criteria.type != :derived
            template = HQMF::DataCriteria.template_id_for_definition(data_criteria.definition, data_criteria.status, data_criteria.negation)
            value_set_oid = data_criteria.code_list_id
            begin
              qrda_template = HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_oid(template,value_set_oid)
            rescue
              value_set_oid = 'In QRDA Header (Non Null Value)'
              qrda_template = 'N/A'
            end # end begin recue
             description = "#{HQMF::DataCriteria.title_for_template_id(template).titleize}: #{data_criteria.title}"
             result << {description: description, oid: value_set_oid, template: qrda_template, rationale: rationale[data_criteria.id]}
            if data_criteria.temporal_references
              data_criteria.temporal_references.each do |temporal_reference|
                if temporal_reference.reference.id != 'MeasurePeriod'
                  result.concat loop_data_criteria(hqmf, hqmf.data_criteria(temporal_reference.reference.id), rationale)
                end  #if temporal_reference.reference.id
              end # end  data_criteria.temporal_references.each do |temporal_reference|
            end# end if data_criteria.temporal_references
          else #data_criteria.type != :derived
            (data_criteria.children_criteria || []).each do |child_id|
              result.concat loop_data_criteria(hqmf, hqmf.data_criteria(child_id), rationale)
            end
          end
        end
        result
      end

      def self.loop_preconditions(hqmf, parent, rationale)
        result = []
        parent.preconditions.each do |precondition|
          parent_key = "precondition_#{parent.id}"
          key = "precondition_#{precondition.id}"
          if precondition.preconditions.empty?
            data_criteria = hqmf.data_criteria(precondition.reference.id)
            result.concat loop_data_criteria(hqmf, data_criteria, rationale)
          else
            if (rationale[parent_key] && rationale[key]) 
              result.concat  loop_preconditions(hqmf, precondition, rationale)
            end
          end
        end
        result
      end

    end
  end
end