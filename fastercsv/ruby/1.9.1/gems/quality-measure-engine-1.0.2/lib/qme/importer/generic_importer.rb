module QME
  module Importer
    # Class that can be used to create a HITSP C32 importer for any quality measure. This class will construct
    # several SectionImporter for the various sections of the C32. When initialized with a JSON measure definition
    # it can then be passed a C32 document and will return a Hash with all of the information needed to calculate the measure.
    class GenericImporter

      class << self
        attr_accessor :warnings
      end

      @warnings = []

      # Creates a generic importer for any quality measure.
      #
      # @param [Hash] definition A measure definition described in JSON
      def initialize(definition)
        @definition = definition
        @warnings = []
      end

      # Parses a HITSP C32 document and returns a Hash of information related to the measure
      #
      # @param [Hash] patient_hash representation of a patient
      # @return [Hash] measure information
      def parse(patient_hash)
        measure_info = {}
        @definition['measure'].each_pair do |property, description|
          raise "No standard_category for #{property}" if !description['standard_category']
          matcher = PropertyMatcher.new(description)
          enrty_filter = filter_for_property(description['standard_category'], description['qds_data_type'])
          entry_list = enrty_filter.call(patient_hash)
          if ! entry_list.empty?
            matched_list = matcher.match(entry_list)
            measure_info[property] = matched_list if matched_list.length > 0
          end
        end
        measure_info
      end

      private

      def create_section_filter(*sections)
        Proc.new do |patient_hash|
          sections.map do |section|
            if patient_hash[section]
              patient_hash[section]
            else
              []
            end
          end.flatten
        end
      end

      def create_section_and_status_filter(status, *sections)
        section_filter = create_section_filter(*sections)
        Proc.new do |patient_hash|
          entry_list = section_filter.call(patient_hash)
          entry_list.select do |entry|
            entry.status.nil? || entry.status == status
          end
        end
      end

      def filter_for_property(standard_category, qds_data_type)
        # Currently unsupported categories: negation_rationale, risk_category_assessment
        case standard_category
        when 'encounter'
          create_section_filter(:encounters)
        when 'procedure'
          case qds_data_type
          when 'procedure_performed'
            create_section_filter(:procedures)
          when 'procedure_adverse_event', 'procedure_intolerance'
            create_section_filter(:allergies)
          when 'procedure_result'
            create_section_filter(:procedures, :results, :vital_signs)
          end
        when 'risk_category_assessment'
          create_section_filter(:procedures)
        when 'communication'
          create_section_filter(:procedures)
        when 'laboratory_test'
          create_section_filter(:results, :vital_signs)
        when 'physical_exam'
          create_section_filter(:vital_signs)
        when 'medication'
          case qds_data_type
          when 'medication_dispensed', 'medication_order', 'medication_active', 'medication_administered'
            create_section_filter(:medications, :immunizations)
          when 'medication_allergy', 'medication_intolerance', 'medication_adverse_event'
            create_section_filter(:allergies)
          end
        when 'diagnosis_condition_problem'
          case qds_data_type
          when 'diagnosis_active'
            create_section_and_status_filter(:active, :conditions, :social_history)
          when 'diagnosis_inactive'
            create_section_and_status_filter(:inactive, :conditions, :social_history)
          when 'diagnosis_resolved'
            create_section_and_status_filter(:resolved, :conditions, :social_history)
          end
        when 'symptom'
          create_section_filter(:conditions, :social_history)
        when 'individual_characteristic'
          create_section_filter(:conditions, :social_history)
        when 'device'
          case qds_data_type
          when 'device_applied'
            create_section_filter(:conditions, :procedures, :care_goals, :medical_equipment)
          when 'device_allergy'
            create_section_filter(:allergies)
          end
        when 'care_goal'
          create_section_filter(:care_goals)
        when 'diagnostic_study'
          create_section_filter(:procedures)
        when 'substance'
          create_section_filter(:allergies)
        else
          unless self.class.warnings.include?(standard_category)
            puts "Warning: Unsupported standard_category (#{standard_category})"
            self.class.warnings << standard_category
          end
          Proc.new {[]} # A proc that returns an empty array
        end
      end
    end
  end
end