module HQMF2
  module Generator

    def self.render_template(name, params)
      template_path = File.expand_path(File.join('..', "#{name}.xml.erb"), __FILE__)
      template_str = File.read(template_path)
      template = ERB.new(template_str, nil, '-', "_templ#{HQMF::Counter.instance.next}")
      context = ErbContext.new(params)
      template.result(context.get_binding)
    end

    # Class to serialize HQMF::Document as HQMF V2 XML
    class ModelProcessor
      # Convert the supplied model instance to XML
      # @param [HQMF::Document] doc the model instance
      # @return [String] the serialized XML as a String
      def self.to_hqmf(doc)
        HQMF2::Generator.render_template('document', {'doc' => doc})
      end
    end

    # Utility class used to supply a binding to Erb. Contains utility functions used
    # by the erb templates that are used to generate the HQMF document.
    class ErbContext < OpenStruct


      def initialize(vars)
        super(vars)
        @local_var_names = {}
        @local_var_counter = {}
      end

      # Get a binding that contains all the instance variables
      # @return [Binding]
      def get_binding
        binding
      end

      def xml_for_local_variable(criteria)
        name = @local_var_names[criteria.id]
        unless name
          if criteria.specific_occurrence && !criteria.id.starts_with?("Occurrence#{criteria.specific_occurrence}")
            name = "Occurrence#{criteria.specific_occurrence}#{criteria.id}"
          else
            name = criteria.id
          end
          @local_var_names[criteria.id] = name
        end
        HQMF2::Generator.render_template('local_variable', {'name' => name})
      end

      def xml_for_reference_id(id)
        reference = HQMF::Reference.new(id)
        xml_for_reference(reference)
      end

      def xml_for_reference(reference)
        HQMF2::Generator.render_template('reference', {'doc' => doc, 'reference' => reference})
      end

      def xml_for_attribute(attribute)
        HQMF2::Generator.render_template('attribute', {'attribute' => attribute})
      end

      def xml_for_fields(criteria)
        fields = []
        if criteria.field_values
          criteria.field_values.each_pair do |key, value|
            if key == "FLFS"
              fields << HQMF2::Generator.render_template('fulfills', {'value' => value})
            else
              details = HQMF::DataCriteria::FIELDS[key]
              details[:code_system_name] = HealthDataStandards::Util::CodeSystemHelper.code_system_for(details[:code_system])
              details[:id] = "#{criteria.id}_#{key}"
              fields << HQMF2::Generator.render_template('field', {'details' => details, 'value' => value})
            end
          end
        end
        if criteria.specific_occurrence
          fields << HQMF2::Generator.render_template('specific_occurrence', {'source_criteria_id' => criteria.source_data_criteria, 'type' => criteria.specific_occurrence_const, 'id' => criteria.specific_occurrence})
        elsif criteria.source_data_criteria
          fields << HQMF2::Generator.render_template('source', {'source_criteria_id' => criteria.source_data_criteria})
        end
        fields.join
      end

      def xml_for_value(value, element_name='value', include_type=true)
        HQMF2::Generator.render_template('value', {'doc' => doc, 'value' => value, 'name' => element_name, 'include_type' => include_type})
      end

      def xml_for_code(criteria, element_name='code', include_type=true)
        HQMF2::Generator.render_template('code', {'doc' => doc, 'criteria' => criteria, 'name' => element_name, 'include_type' => include_type})
      end

      def xml_for_derivation(data_criteria)
        xml = ''
        if data_criteria.derivation_operator
          xml = HQMF2::Generator.render_template('derivation', {'doc' => doc, 'criteria' => data_criteria})
        end
        xml
      end

      def xml_for_effective_time(data_criteria)
        xml = ''
        if data_criteria.effective_time
          xml = HQMF2::Generator.render_template('effective_time', {'doc' => doc, 'effective_time' => data_criteria.effective_time})
        end
        xml
      end

      def xml_for_reason(data_criteria)
        xml = ''
        if data_criteria.negation && data_criteria.negation_code_list_id
          xml = HQMF2::Generator.render_template('reason', {'doc' => doc, 'code_list_id' => data_criteria.negation_code_list_id})
        end
        xml
      end

      def xml_for_template(data_criteria, is_source_data_criteria)
        xml = ''
        templates = []
        # Add a template ID if one is defined for this data criteria
        template_id = HQMF::DataCriteria.template_id_for_definition(data_criteria.definition, data_criteria.status, false, "r2")
        if template_id
          templates << {:id => template_id, :title => HQMF::DataCriteria.title_for_template_id(template_id, 'r2')}
        end
        # Add our own template id if this is a source data criteria from HQMF V1. Source
        # data criteria are the 'raw' HQMF V1 data criteria before any restrictions are applied
        # they are only used for negating specific occurrences
        if is_source_data_criteria
          templates << {:id => HQMF::DataCriteria::SOURCE_DATA_CRITERIA_TEMPLATE_ID, :title => HQMF::DataCriteria::SOURCE_DATA_CRITERIA_TEMPLATE_TITLE}
        end
        if templates.length > 0
          xml = HQMF2::Generator.render_template('template_id', {'templates' => templates})
        end
        xml
      end

      def xml_for_description(data_criteria)
        xml = ''
        if data_criteria.description
          xml = HQMF2::Generator.render_template('description', {'text' => data_criteria.description})
        end
        xml
      end

      def xml_for_subsets(data_criteria)
        subsets_xml = []
        if data_criteria.subset_operators
          subsets_xml = data_criteria.subset_operators.collect do |operator|
            HQMF2::Generator.render_template('subset', {'doc' => doc, 'subset' => operator, 'criteria' => data_criteria})
          end
        end
        subsets_xml.join()
      end

      def xml_for_precondition_cv(precondition)
        HQMF2::Generator.render_template('precondition_cv', {'doc' => doc, 'precondition' => precondition})
      end

      def xml_for_precondition(precondition)
        HQMF2::Generator.render_template('precondition', {'doc' => doc, 'precondition' => precondition})
      end

      def xml_for_data_criteria(data_criteria, is_source_data_criteria)
        HQMF2::Generator.render_template(data_criteria_template_name(data_criteria), {'doc' => doc, 'criteria' => data_criteria, 'is_source_data_criteria' => is_source_data_criteria})
      end

      def xml_for_population_criteria(population, criteria_id)
        xml = ''
        population_criteria = doc.population_criteria(population[criteria_id])
        if population_criteria && population_element_prefix(criteria_id) != "measureObservation"
          xml = HQMF2::Generator.render_template('population_criteria', {'doc' => doc, 'population' => population, 'criteria_id' => criteria_id, 'population_criteria' => population_criteria})
        end
        xml
      end

      def xml_for_temporal_references(criteria)
        refs = []
        if criteria.temporal_references
          refs = criteria.temporal_references.collect do |reference|
            HQMF2::Generator.render_template('temporal_relationship', {'doc' => doc, 'relationship' => reference, 'criteria' => criteria})
          end
        end
        refs.join
      end

      def xml_for_temporal_relationship_attribute(criteria, relationship)
        targetCriteria = doc.data_criteria(relationship.reference.id)
        if (criteria.field_values || targetCriteria.try(:field_values))
          sourceKeys = (criteria.field_values || {}).keys.select {|key| [:timestamp, :nested_timestamp].include? HQMF::DataCriteria::FIELDS[key][:field_type]}
          targetKeys = (targetCriteria.try(:field_values) || {}).keys.select {|key| [:timestamp, :nested_timestamp].include? HQMF::DataCriteria::FIELDS[key][:field_type]}
          if (!sourceKeys.empty? || !targetKeys.empty?)
            data = {
              sourceKeys: sourceKeys,
              targetKeys: targetKeys
            }

            HQMF2::Generator.render_template('temporal_relationship_attribute', {'doc' => doc, 'criteria' => criteria, 'targetCriteria'=>targetCriteria, 'data'=> data})
          end
        end

      end

      def temporal_relationship_attribute_effective_time(field)
        {facility_arrival: 'low',
        facility_departure: 'high',
        discharge_time: 'high',
        admit_time: 'low',
        start_date: 'low',
        end_date: 'high',
        incision_time: 'low',
        removal_time: 'high'}[HQMF::DataCriteria::FIELDS[field][:coded_entry_method]]
      end

      def xml_for_measure_observation_definition(doc)
        observation = doc.find_population_by_type(HQMF::PopulationCriteria::OBSERV)
        msrpopl = doc.find_population_by_type( HQMF::PopulationCriteria::MSRPOPL)
        HQMF2::Generator.render_template('measure_observation_definition', {'doc' => doc, 'observation' => observation, "msrpopl" => msrpopl})
      end

      def expression_for_observation(doc,observation)
        pre = observation.preconditions[0]
        if pre && pre.reference
          dc = doc.data_criteria(pre.reference.id)
          children = dc.children_criteria
          if children && children.length == 2
            return "#{children[0]} - #{children[1]}"
          end
        end
      end

      def data_criteria_should_be_grouper?(criteria)
        return false unless criteria
        return false unless criteria.definition == 'derived'
        return true unless criteria.subset_operators
        criteria.subset_operators.all? {|o| o.supports_grouper_criteria?}
      end

      def percision_unit_for_range(relationship)
        percision_map = {'a'=>'d', 'mo'=>'d', 'wk'=>'d', 'd'=>'d', 'h'=>'min', 'min'=>'min', 's'=>'s'}
        percision_map[relationship.try(:range).try(:high).try(:unit) || relationship.try(:range).try(:low).try(:unit) || "min"]
      end

      def oid_for_name(code_system_name)
        HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(code_system_name)
      end

      def reference_element_name(id)
        referenced_criteria = doc.data_criteria(id)
        element_name_prefix(referenced_criteria)
      end

      def reference_type_name(id)
        referenced_criteria = doc.data_criteria(id)
        type = nil
        if referenced_criteria
          type = referenced_criteria.type
        elsif id=="MeasurePeriod"
          type = :observation
        end
        if !type
          raise "No data criteria with ID: #{id}"
        end
        case type
        when :encounters
          'ENC'
        when :procedures
          'PROC'
        when :medications, :allMedications
          'SBADM'
        when :medication_supply
          'SPLY'
        when :observation
           'OBS'
        else
          if data_criteria_should_be_grouper?(referenced_criteria)
            'GROUPER'
          else
            'OBS'
          end
        end
      end

      def code_for_characteristic(characteristic)
        case characteristic
        when :birthtime
          '21112-8'
        when :age
          '424144002'
        when :gender
          '263495000'
        when :languages
          '102902016'
        when :maritalStatus
          '125680007'
        when :race
          '103579009'
        else
          raise "Unknown demographic code [#{characteristic}]"
        end
      end

      def is_transfer(code)
        if code == "TRANSFER_TO" || code == "TRANSFER_FROM"
          true
        else
          false
        end
      end

      def oid_for_characteristic(characteristic)
        case characteristic
        when :birthtime
          '2.16.840.1.113883.6.1'
        else
          '2.16.840.1.113883.6.96'
        end
      end

      def data_criteria_template_name(data_criteria)
        case data_criteria.definition
        when 'diagnosis', 'diagnosis_family_history'
          'condition_criteria'
        when 'encounter'
          'encounter_criteria'
        when 'procedure', 'risk_category_assessment', 'physical_exam', 'communication_from_patient_to_provider', 'communication_from_provider_to_provider', 'device', 'diagnostic_study', 'intervention'
          if data_criteria.value.nil?
            'procedure_criteria'
          else
            'observation_criteria'
          end
        when 'medication'
          case data_criteria.status
          when 'dispensed', 'ordered'
            'supply_criteria'
          else # active or administered
            'substance_criteria'
          end
        when 'patient_characteristic', 'patient_characteristic_birthdate', 'patient_characteristic_clinical_trial_participant', 'patient_characteristic_expired', 'patient_characteristic_gender', 'patient_characteristic_age', 'patient_characteristic_languages', 'patient_characteristic_marital_status', 'patient_characteristic_race'
          'characteristic_criteria'
        when 'variable'
          'variable_criteria'
        when 'derived'
          if data_criteria_should_be_grouper?(data_criteria)
            'grouper_criteria'
          else
            'observation_criteria'
          end
        else
          'observation_criteria'
        end
      end

      def section_name(data_criteria)
        data_criteria.definition.to_s
      end

      def element_name_prefix(data_criteria)
        type = data_criteria ? data_criteria.type : :observation
        case type
        when :encounters
          'encounter'
        when :procedures
          'procedure'
        when :medications, :allMedications
          'substanceAdministration'
        when :medication_supply
          'supply'
        else
          if data_criteria_should_be_grouper?(data_criteria)
            'grouper'
          else
            'observation'
          end
        end
      end

      def population_element_prefix(population_criteria_code)
        case population_criteria_code
        when HQMF::PopulationCriteria::IPP
          'initialPopulation'
        when HQMF::PopulationCriteria::DENOM
          'denominator'
        when HQMF::PopulationCriteria::NUMER
          'numerator'
        when HQMF::PopulationCriteria::NUMEX
          'numeratorExclusion'
        when HQMF::PopulationCriteria::DENEXCEP
          'denominatorException'
        when HQMF::PopulationCriteria::DENEX
          'denominatorExclusion'
        when HQMF::PopulationCriteria::MSRPOPL
          'measurePopulation'
        when HQMF::PopulationCriteria::MSRPOPLEX
          'measurePopulationExclusion'
        when HQMF::PopulationCriteria::OBSERV
           'measureObservation'
        when HQMF::PopulationCriteria::STRAT
           'stratifier'
        else
          raise "Unknown population criteria type #{population_criteria_code}"
        end
      end
    end

  end
end
