module HealthDataStandards
  module CQM
    class PatientCache
      include Mongoid::Document
      include Mongoid::Timestamps
      store_in collection: 'patient_cache'
      index "value.last" => 1
      index "bundle_id" => 1
      index "value.medical_record_id" => 1
      embeds_one :value, class_name: "HealthDataStandards::CQM::PatientCacheValue", inverse_of: :patient_cache

      def record
        Record.where(:medical_record_number => value['medical_record_id'], :test_id => value["test_id"]).first
      end

      def self.smoking_gun_rational(hqmf_id, sub_ids=nil, filter ={})

        match = {"value.IPP" => {"$gt" => 0},
                 "value.measure_id" => hqmf_id
        }.merge filter

        if sub_ids
          match["value.sub_id"] = {"$in" => sub_ids}
        end

        group = {"$group" => {"_id" => "$value.medical_record_id", "rational" => {"$push"=> "$value.rationale"}}}
        aggregate = self.mongo_client.command(:aggregate => 'patient_cache', :pipeline => [{"$match" =>match},group])
        aggregate_document = aggregate.documents[0]
        merged = {}
        aggregate_document["result"].each do |agg|
          mrn = agg["_id"]
          rational = {}
          merged[mrn] = rational
          agg["rational"].each do |r|
            rational.merge! r
          end
        end

        merged
      end
    end

    class PatientCacheValue

      include Mongoid::Document

      embedded_in :patient_cache, inverse_of: :value

      field :DENOM, type: Integer
      field :NUMER, type: Integer
      field :NUMEX, type: Integer
      field :DENEX, type: Integer
      field :DENEXCEP, type: Integer
      field :MSRPOPL, type: Integer
      field :MSRPOPLEX, type: Integer
      field :OBSERV
      field :antinumerator, type: Integer
      field :IPP, type: Integer
      field :measure_id, type: String
      field :sub_id, type: String
      field :patient_id, type: BSON::ObjectId
    end

  end

end
