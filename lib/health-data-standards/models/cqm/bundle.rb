module HealthDataStandards
  module CQM

    class Bundle
      include Mongoid::Document
      store_in collection: 'bundles'
      field :title, type: String
      field :version, type: String
      field :license, type: String
      field :extensions, type: Array
      field :effective_date
      field :measure_period_start
      field :records, type: Array
      field :active, type: Boolean

      validates_presence_of :version

      def self.active
        self.where({active: true})
      end

      def measures
      	 HealthDataStandards::CQM::Measure.where({bundle_id: self.id}).order_by([["id", :asc],["sub_id",:asc]])
      end

      def records
      	Record.where(bundle_id: self._id, test_id: nil).order_by([["last", :asc]])
      end


      def value_sets
        HealthDataStandards::SVS::ValueSet.in(bundle_id: self.id)
      end

      def delete
        self.measures.destroy
        self.records.destroy
        self.value_sets.destroy
        super
      end


	   end
  end
end