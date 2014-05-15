module HealthDataStandards
  module CQM
    class Prefilter
      include Mongoid::Document
      # What field on the Record do we want to compare against
      field :record_field, type: String
      # greater than, less than, etc.
      field :comparison, type: String
      # Is it based on the effective_time, like 65yo during measure period
      field :effective_time_based, type: Boolean, default: false
      # If effective_time_based, what is the offset from effective_time in years
      field :effective_time_offset, type: Integer
      # Comparison to a plain old value, like gender == 'F'
      field :desired_value

      embedded_in :measure

      def build_query_hash(effective_time)
        filter_value = if self.effective_time_based
          et = Time.at(effective_time)
          et.years_ago(effective_time_offset).to_i
        else
          self.desired_value
        end

        if self.comparison == '$eq'
          {self.record_field => desired_value}
        else
          {self.record_field => {self.comparison => filter_value}}
        end
      end
    end
  end
end
