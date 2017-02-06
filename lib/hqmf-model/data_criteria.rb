module HQMF
  # Represents a data criteria specification
  class DataCriteria

    include HQMF::Conversion::Utilities

    SOURCE_DATA_CRITERIA_TEMPLATE_ID = '2.16.840.1.113883.3.100.1.1'
    SOURCE_DATA_CRITERIA_TEMPLATE_TITLE = 'Source data criteria'

    XPRODUCT = 'XPRODUCT'
    UNION = 'UNION'
    INTERSECT = 'INTERSECT'

    SATISFIES_ALL = 'satisfies_all'
    SATISFIES_ANY = 'satisfies_any'
    VARIABLE = 'variable'

    # An object containing metadata information for all attributes that are used within the measure data criteria being parsed.
    #
    # fields include:
    # `title`: The QDM human readable title for the attribute.
    # `coded_entry_method`: this appears to be a way that fields here are referenced within Bonnie.
    # `field_type`: The type of whatever will be stored for this attribute. This will often be `:timestamp` or `:value`.
    # `code`: The code for the entry. This should be included to make HQMF generation work properly. This is whatever code is dictated in the HQMF. For Diagnosis, this is in [HQMF QDM IG](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=346) vol 2 page 155 and is `29308-4`.
    # `code_system`: This is the oid for whatever code system contains `code`. For Diagnosis, this is LOINC: `2.16.840.1.113883.6.1`. This is also located at (http://www.hl7.org/implement/standards/product_brief.cfm?product_id=346) vol 2 page 155.
    # `template_id`: These appear to be related to HQMFr1 template ids. These appear to be dangerously out of date. Don't use.
    FIELDS = {'ABATEMENT_DATETIME' => {title:'Abatement Datetime', coded_entry_method: :end_date, field_type: :timestamp},
              'ACTIVE_DATETIME' => {title:'Active Date/Time', coded_entry_method: :active_date_time, field_type: :timestamp},
              'ADMISSION_DATETIME' => {title:'Admission Date/Time', coded_entry_method: :admit_time, code: '399423000', code_system:'2.16.840.1.113883.6.96', field_type: :timestamp},
              # QDM 5.0 addition. This is the same as FACILITY_LOCATION.
              # TODO: (LDY 10/5/2016) this is a new attribute from QDM 5.0. We do not yet have the code or template_id for this. This should be updated when we do.
              'ADMISSION_SOURCE' => {title:'Admission Source', coded_entry_method: :admission_source, field_type: :value},
              'ANATOMICAL_APPROACH_SITE' => {title:'Anatomical Approach Site', coded_entry_method: :anatomical_approach,  field_type: :value},
              'ANATOMICAL_LOCATION_SITE' => {title:'Anatomical Location Site', coded_entry_method: :anatomical_location,  field_type: :value},
              'ANATOMICAL_STRUCTURE' => {title:'Anatomical Structure', coded_entry_method: :anatomical_structure, code: '91723000', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1000.2', field_type: :value},
              'CAUSE' => {title:'Cause', coded_entry_method: :cause_of_death, code: '42752001', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1017.2', field_type: :value},
              'CUMULATIVE_MEDICATION_DURATION' => {title:'Cumulative Medication Duration', coded_entry_method: :cumulative_medication_duration, code: '261773006', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1001.3', field_type: :value},
              # MISSING Date - The date that the patient passed away. - Patient Characteristic Expired
              'DIAGNOSIS' => {title:'Diagnosis', coded_entry_method: :diagnosis, field_type: :value},
              'DISCHARGE_DATETIME' => {title:'Discharge Date/Time', coded_entry_method: :discharge_time, code: '442864001', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1025.1', field_type: :timestamp},
              # TODO: (LDY 10/5/2016) this changed from "discharge status" to "discharge disposition". likely there is a code and template id change necessary. these are not yet known.
              'DISCHARGE_STATUS' => {title:'Discharge Disposition', coded_entry_method: :discharge_disposition, code: '309039003', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1003.2', field_type: :value},
              # TODO: (LDY 10/4/2016) this changed from "dose" to "dosage". it's possible that there's another code associated with this. this code was not available at the time of this change.
              'DOSE' => {title:'Dosage', coded_entry_method: :dose, code: '398232005', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1004.1', field_type: :value},
              'FACILITY_LOCATION' => {title:'Facility Location', coded_entry_method: :facility, code: 'SDLOC', field_type: :value},
              # TODO: (LDY 10/5/2016) this changed from 'facility arrival/departure' to 'location period'. likely there is a code and template id change necessary. these are not yet known.
              'FACILITY_LOCATION_ARRIVAL_DATETIME' => {title:'Location Period Start Date/Time', coded_entry_method: :facility_arrival, code: 'SDLOC_ARRIVAL', field_type: :nested_timestamp},
              'FACILITY_LOCATION_DEPARTURE_DATETIME' => {title:'Location Period End Date/Time', coded_entry_method: :facility_departure, code: 'SDLOC_DEPARTURE', field_type: :nested_timestamp},
              'FREQUENCY' => {title:'Frequency', coded_entry_method: :administration_timing, code: '307430002', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1006.1', field_type: :value},
              'HEALTH_RECORD_FIELD' => {title: 'Health Record Field', coded_entry_method: :health_record_field, code: '395676008', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.10.20.28.3.102:2014-11-24', field_type: :value},
              'INCISION_DATETIME' => {title:'Incision Date/Time', coded_entry_method: :incision_time, code: '34896006', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.10.20.24.3.89', field_type: :timestamp},
              'LATERALITY' => {title:'Laterality', coded_entry_method: :laterality, code: '272741003', code_system:'2.16.840.1.113883.6.96', template_id: '', field_type: :value},
              'LENGTH_OF_STAY' => {title:'Length of Stay', coded_entry_method: :length_of_stay, code: '183797002', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1029.3', field_type: :value},
              'METHOD' => {title:'Method', coded_entry_method: :method, template_id: '', field_type: :value},
              # Negation Rationale isn't encoded
              'ONSET_AGE' => {title:'Onset Age', coded_entry_method: :onset_age, code: '445518008', code_system:'2.16.840.1.113883.6.96', template_id: '', field_type: :value},
              'ONSET_DATETIME' => {title:'Onset Datetime', coded_entry_method: :start_date, field_type: :timestamp},
              'ORDINAL' => {title:'Ordinality', coded_entry_method: :ordinality, code: '117363000', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1012.2', field_type: :value}, # previous
              'ORDINALITY' => {title:'Ordinality', coded_entry_method: :ordinality, code: '117363000', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1012.2', field_type: :value},
              'PATIENT_PREFERENCE' => {title:'Patient Preference', coded_entry_method: :patient_preference,  code: 'PAT', code_system: '2.16.840.1.113883.5.8', template_id: '2.16.840.1.113883.10.20.24.3.83', field_type: :value},
              'PRINCIPAL_DIAGNOSIS' => {title:'Principal Diagnosis', coded_entry_method: :principal_diagnosis, field_type: :value},
              'PROVIDER_PREFERENCE' => {title:'Provider Preference', coded_entry_method: :provider_preference, code: '103323008', code_system: '2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.10.20.24.3.84', field_type: :value},
              'RADIATION_DOSAGE' => {title:'Radiation Dosage', coded_entry_method: :radiation_dose, code: '228815006', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.10.20.24.3.91', field_type: :value},
              'RADIATION_DURATION' => {title:'Radiation Duration', coded_entry_method: :radiation_duration, code: '306751006', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.10.20.24.3.91', field_type: :value},
              'REACTION'=> {title:'Reaction', coded_entry_method: :reaction, code: '263851003', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.10.20.24.3.85', field_type: :value},
              'REASON' => {title:'Reason', coded_entry_method: :reason, code: '410666004', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.10.20.24.3.88', field_type: :value},
              'RECORDED_DATETIME' => {title:'Recorded Datetime', coded_entry_method: :start_date, field_type: :timestamp},
              'REFERENCE_RANGE_HIGH' => {title:'Reference Range - High', coded_entry_method: :reference_range_high, field_type: :value},
              'REFERENCE_RANGE_LOW' => {title:'Reference Range - Low', coded_entry_method: :reference_range_low, field_type: :value},
              'REFILLS' => {title:'Refills', coded_entry_method: :refills,  field_type: :value},
              'RELATED_TO' => {title:'Related To', coded_entry_method: :related_to,  code: 'REL', codeSystem: '2.16.840.1.113883.1.11.11603', field_type: :value},
              'RELATIONSHIP' => {title:'Relationship', coded_entry_method: :relationship_to_patient, field_type: :value},
              'REMOVAL_DATETIME' => {title:'Removal Date/Time', coded_entry_method: :removal_time, code: '118292001', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1032.1', field_type: :timestamp},
              # Result isn't encoded
              # TODO: (LDY 10/4/2016) RESULT_DATETIME is a new attribute in QDM 5.0. We do not yet have codes/template information for this.
              'RESULT_DATETIME' => {title:'Result Date/Time', coded_entry_method: :result_date_time, field_type: :timestamp},
              'ROUTE' => {title:'Route', coded_entry_method: :route, code: '263513008', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1020.2', field_type: :value},
              'SEVERITY' => {title:'Severity', coded_entry_method: :severity, code: 'SEV', code_system:'2.16.840.1.113883.5.4', template_id: '2.16.840.1.113883.10.20.22.4.8', field_type: :value},
              'SIGNED_DATETIME' =>  {title:'Signed Date/Time', coded_entry_method: :signed_date_time, field_type: :timestamp},
              'START_DATETIME' => {title:'Start Date/Time', coded_entry_method: :start_date, code: '398201009', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1027.1', field_type: :timestamp},
              # STATUS is referenced in the code as `qdm_status` because entry/Record already has a `status`/`status_code` field which has a different meaning
              'STATUS' => {title: 'Status', coded_entry_method: :qdm_status, code: '33999-4', code_system:'2.16.840.1.113883.6.1', field_type: :value},
              'STOP_DATETIME' => {title:'Stop Date/Time', coded_entry_method: :end_date, code: '397898000', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1026.1', field_type: :timestamp},
              # TODO: (LDY 10/4/2016) SUPPLY is a new attribute in QDM 5.0. We do not yet have codes/template information for this.
              'SUPPLY' => {title:'Supply', coded_entry_method: :supply, field_type: :value},
              'TARGET_OUTCOME' => {title:'Target Outcome', coded_entry_method: :target_outcome, code: '385676005', code_system:'2.16.840.1.113883.6.96', template_id: '', field_type: :value},
              # MISSING Time - The time that the patient passed away

              # Custom field values
              'FLFS' => {title:'Fulfills', coded_entry_method: :fulfills, code: 'FLFS', field_type: :reference},
              'SOURCE' => {title:'Source', coded_entry_method: :source, code: '260753009', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.2001.2', field_type: :value},
              'TRANSFER_FROM' => {title:'Transfer From', coded_entry_method: :transfer_from, code: 'TRANSFER_FROM', template_id: '2.16.840.1.113883.10.20.24.3.81', field_type: :value},
              'TRANSFER_FROM_DATETIME' => {title:'Transfer From Date/Time', coded_entry_method: :transfer_from_time, code: 'ORG_TIME', template_id: '2.16.840.1.113883.10.20.24.3.81', field_type: :nested_timestamp},
              'TRANSFER_TO' => {title:'Transfer To', coded_entry_method: :transfer_to, code: 'TRANSFER_TO', template_id: '2.16.840.1.113883.10.20.24.3.82', field_type: :value},
              'TRANSFER_TO_DATETIME' => {title:'Transfer To Date/Time', coded_entry_method: :transfer_to_time, code: 'DST_TIME', template_id: '2.16.840.1.113883.10.20.24.3.82', field_type: :nested_timestamp}
          }

    # maps attribute codes to the attribute keys
    VALUE_FIELDS = {'399423000' => 'ADMISSION_DATETIME',
                    '42752001' => 'CAUSE',
                    '261773006' => 'CUMULATIVE_MEDICATION_DURATION',
                    '363819003' => 'CUMULATIVE_MEDICATION_DURATION', # previous
                    '442864001' => 'DISCHARGE_DATETIME',
                    '309039003' => 'DISCHARGE_STATUS',
                    '398232005' => 'DOSE',
                    'SDLOC'     => 'FACILITY_LOCATION',
                    'SDLOC_ARRIVAL'   => 'FACILITY_LOCATION_ARRIVAL_DATETIME',
                    'SDLOC_DEPARTURE' => 'FACILITY_LOCATION_DEPARTURE_DATETIME',
                    '307430002' => 'FREQUENCY',
                    '260864003' => 'FREQUENCY', # previous
                    '395676008' => 'HEALTH_RECORD_FIELD',
                    '34896006'  => 'INCISION_DATETIME',
                    '272741003' => 'LATERALITY',
                    '183797002' => 'LENGTH_OF_STAY',
                    '445518008' => 'ONSET_AGE',
                    '117363000' => 'ORDINALITY',
                    'PAT'       => 'PATIENT_PREFERENCE',
                    '103323008' => 'PROVIDER_PREFERENCE',
                    '228815006' => 'RADIATION_DOSAGE',
                    '306751006' => 'RADIATION_DURATION',
                    '263851003' => 'REACTION',
                    '410666004' => 'REASON',
                    'REL'       => 'RELATED_TO',
                    '118292001' => 'REMOVAL_DATETIME',
                    '263513008' => 'ROUTE',
                    'SEV'       => 'SEVERITY',
                    '398201009' => 'START_DATETIME',
                    '33999-4'   => 'STATUS',
                    '397898000' => 'STOP_DATETIME',
                    '385676005' => 'TARGET_OUTCOME',

                    # Custom field values
                    '91723000'  => 'ANATOMICAL_STRUCTURE',
                    'FLFS' => 'FLFS',
                    '260753009' => 'SOURCE',
                    'TRANSFER_FROM' => 'TRANSFER_FROM',
                    'ORG_TIME' => 'TRANSFER_FROM_DATETIME',
                    'TRANSFER_TO' => 'TRANSFER_TO',
                    'DST_TIME' => 'TRANSFER_TO_DATETIME'

                   }


    attr_reader :title, :description, :code_list_id, :derivation_operator , :specific_occurrence, :specific_occurrence_const, :source_data_criteria, :variable
    attr_accessor :id, :value, :field_values, :children_criteria, :effective_time, :status, :temporal_references, :subset_operators, :definition, :inline_code_list, :negation_code_list_id, :negation, :display_name, :comments

    # Create a new data criteria instance
    # @param [String] id
    # @param [String] title
    # @param [String] display_name
    # @param [String] description
    # @param [String] code_list_id
    # @param [String] negation_code_list_id
    # @param [List<String>] children_criteria (ids of children data criteria)
    # @param [String] derivation_operator
    # @param [String] definition
    # @param [String] status
    # @param [Value|Range|Coded] value
    # @param [Hash<String,Value|Range|Coded>] field_values
    # @param [Range] effective_time
    # @param [Hash<String,[String]>] inline_code_list
    # @param [boolean] negation
    # @param [String] negation_code_list_id
    # @param [List<TemporalReference>] temporal_references
    # @param [List<SubsetOperator>] subset_operators
    # @param [String] specific_occurrence
    # @param [String] specific_occurrence_const
    # @param [String] source_data_criteria (id for the source data criteria, important for specific occurrences)
    # @param [String] user comments for the criteria
    # @param [Boolean] variable defines if the element is a QDM variable
    def initialize(id, title, display_name, description, code_list_id, children_criteria, derivation_operator, definition, status, value, field_values, effective_time, inline_code_list, negation, negation_code_list_id, temporal_references, subset_operators, specific_occurrence, specific_occurrence_const, source_data_criteria=nil, comments=nil, variable=false)

      status = normalize_status(definition, status)
      @settings = HQMF::DataCriteria.get_settings_for_definition(definition, status)

      @id = id
      @title = title
      @description = description
      @code_list_id = code_list_id
      @negation_code_list_id = negation_code_list_id
      @children_criteria = children_criteria
      @derivation_operator = derivation_operator
      @definition = definition
      @status = status
      @value = value
      @field_values = field_values
      @effective_time = effective_time
      @inline_code_list = inline_code_list
      @negation = negation
      @negation_code_list_id = negation_code_list_id
      @temporal_references = temporal_references
      @subset_operators = subset_operators
      @specific_occurrence = specific_occurrence
      @specific_occurrence_const = specific_occurrence_const
      @source_data_criteria = source_data_criteria || id
      @comments = comments
      @variable = variable
    end

    # create a new data criteria given a category and sub_category.  A sub category can either be a status or a sub category
    def self.create_from_category(id, title, description, code_list_id, category, sub_category=nil, negation=false, negation_code_list_id=nil)
      settings = HQMF::DataCriteria.get_settings_for_definition(category, sub_category)
      HQMF::DataCriteria.new(id, title, nil, description, code_list_id, nil, nil, settings['definition'], settings['status'], nil, nil, nil, nil, negation, negation_code_list_id, nil, nil, nil,nil)
    end
    def type
      @settings['category'].to_sym
    end
    def property
      @settings['property'].to_sym unless @settings['property'].nil?
    end
    def patient_api_function
      @settings['patient_api_function'].to_sym unless @settings['patient_api_function'].empty?
    end
    def hard_status
      @settings['hard_status']
    end
    def update_copy(hard_status, title, description, derivation_operator, definition)
      @settings['hard_status'] = hard_status
      @title = title
      @description = description
      @derivation_operator = derivation_operator
      @definition = definition
    end
    def definition=(definition)
      @definition = definition
      @settings = HQMF::DataCriteria.get_settings_for_definition(@definition, @status)
    end
    def status=(status)
      @status = status
      @settings = HQMF::DataCriteria.get_settings_for_definition(@definition, @status)
    end

    # Create a new data criteria instance from a JSON hash keyed with symbols
    def self.from_json(id, json)

      title = json["title"] if json["title"]
      display_name = json["display_name"] if json["display_name"]
      description = json["description"] if json["description"]
      code_list_id = json["code_list_id"] if json["code_list_id"]
      children_criteria = json["children_criteria"] if json["children_criteria"]
      derivation_operator = json["derivation_operator"] if json["derivation_operator"]
      definition = json["definition"] if json["definition"]
      status = json["status"] if json["status"]
      value = convert_value(json["value"]) if json["value"]
      field_values = json["field_values"].inject({}){|memo,(k,v)| memo[k.to_s] = convert_value(v); memo} if json["field_values"]
      effective_time = HQMF::Range.from_json(json["effective_time"]) if json["effective_time"]
      inline_code_list = json["inline_code_list"].inject({}){|memo,(k,v)| memo[k.to_s] = v; memo} if json["inline_code_list"]
      negation = json["negation"] || false
      negation_code_list_id = json['negation_code_list_id'] if json['negation_code_list_id']
      temporal_references = json["temporal_references"].map {|reference| HQMF::TemporalReference.from_json(reference)} if json["temporal_references"]
      subset_operators = json["subset_operators"].map {|operator| HQMF::SubsetOperator.from_json(operator)} if json["subset_operators"]
      specific_occurrence = json['specific_occurrence'] if json['specific_occurrence']
      specific_occurrence_const = json['specific_occurrence_const'] if json['specific_occurrence_const']
      source_data_criteria = json['source_data_criteria'] if json['source_data_criteria']
      comments = json['comments'] if json['comments']
      variable = json['variable'] || false

      HQMF::DataCriteria.new(id, title, display_name, description, code_list_id, children_criteria, derivation_operator, definition, status, value, field_values,
                             effective_time, inline_code_list, negation, negation_code_list_id, temporal_references, subset_operators,specific_occurrence,specific_occurrence_const,source_data_criteria, comments, variable)
    end

    def is_same_type?(criteria)
       return @definition == criteria.definition && @hard_status == criteria.hard_status &&
              @negation == criteria.negation && all_code_set_oids.sort == criteria.all_code_set_oids.sort
    end

    def to_json
      json = base_json
      {self.id.to_s.to_sym => json}
    end

    def base_json
      x = nil
      json = build_hash(self, [:title,:display_name,:description,:code_list_id,:children_criteria, :derivation_operator, :property, :type, :definition, :status, :hard_status, :negation, :negation_code_list_id,:specific_occurrence,:specific_occurrence_const,:source_data_criteria,:variable])
      json[:children_criteria] = @children_criteria unless @children_criteria.nil? || @children_criteria.empty?
      json[:value] = ((@value.is_a? String) ? @value : @value.to_json) if @value
      json[:field_values] = @field_values.inject({}) {|memo,(k,v)| memo[k] = (!v.nil? ? v.to_json : nil); memo} if @field_values
      json[:effective_time] = @effective_time.to_json if @effective_time
      json[:inline_code_list] = @inline_code_list if @inline_code_list
      json[:temporal_references] = x if x = json_array(@temporal_references)
      json[:subset_operators] = x if x = json_array(@subset_operators)
      json[:comments] = @comments if @comments
      json
    end

    def has_temporal(temporal_reference)
      @temporal_references.reduce(false) {|found, item| found ||= item == temporal_reference }
    end
    def has_subset(subset_operator)
      @subset_operators.reduce(false) {|found, item| found ||= item == subset_operator }
    end

    def self.statuses_by_definition
      settings_file = File.expand_path('../data_criteria.json', __FILE__)
      settings_map = JSON.parse(File.read(settings_file))
      all_defs = (settings_map.map {|key, value| {category: value['category'],definition:value['definition'],status:(value['status'].empty? ? nil : value['status']), sub_category: value['sub_category'],title:value['title']} unless value['not_supported']}).compact
      by_categories = {}
      all_defs.each do |definition|
        by_categories[definition[:category]]||={}
        status = definition[:status]
        def_key = definition[:definition]
        if status.nil? and definition[:sub_category] and !definition[:sub_category].empty?
          status = definition[:sub_category]
          def_key = def_key.gsub("_#{status}",'')
        end
        by_categories[definition[:category]][def_key]||={category:def_key,statuses:[]}
        by_categories[definition[:category]][def_key][:statuses] << status unless status.nil?
      end
      status_by_category = {}
      by_categories.each {|key, value| status_by_category[key] = value.values}
      status_by_category.delete('derived')
      status_by_category.delete('variable')
      status_by_category.delete('measurement_period')
      status_by_category.values.flatten
    end

    def referenced_data_criteria(document)
      referenced = []
      if (@children_criteria)
        @children_criteria.each do |id|
          dc = document.data_criteria(id)
          referenced << id
          referenced.concat(dc.referenced_data_criteria(document))
        end
      end
      if (@temporal_references)
        @temporal_references.each do |tr|
          id = tr.reference.id
          if (id != HQMF::Document::MEASURE_PERIOD_ID)
            dc = document.data_criteria(id)
            referenced << id
            referenced.concat(dc.referenced_data_criteria(document))
          end
        end
      end
      referenced
    end

    def all_code_set_oids

      # root oid
      referenced_oids = [code_list_id]

      # value oid
      referenced_oids << value.code_list_id if value != nil and value.type == 'CD'

      # negation oid
      referenced_oids << negation_code_list_id if negation_code_list_id != nil

      # field oids
      if field_values != nil
        referenced_oids.concat (field_values.map {|key,field| field.code_list_id if field != nil and field.type == 'CD'})
      end

      referenced_oids

    end

    def self.get_settings_map
      return @settings_map if @settings_map
      settings_file = File.expand_path('../data_criteria.json', __FILE__)
      @settings_map = JSON.parse(File.read(settings_file))
    end

    def self.get_settings_for_definition(definition, status)
      settings_file = File.expand_path('../data_criteria.json', __FILE__)
      settings_map = get_settings_map
      key = definition + ((status.nil? || status.empty?) ? '' : "_#{status}")
      settings = settings_map[key]

      raise "data criteria is not supported #{key}" if settings.nil? || settings["not_supported"]

      settings
    end

    def self.definition_for_template_id(template_id, version='r1')
      get_template_id_map(version)[template_id]
    end

    def self.template_id_for_definition(definition, status, negation, version="r1")
      # in r2 negation uses the same template as a positive assertion
      negation = false if version == "r2"
      get_template_id_map(version).key({'definition' => definition, 'status' => status || '', 'negation' => negation})
    end

    def self.title_for_template_id(template_id, version='r1')
      value = get_template_id_map(version)[template_id]
      if value
        settings = self.get_settings_for_definition(value['definition'], value['status'])
        if settings
          settings['title']
        else
          'Unknown data criteria'
        end
      else
        'Unknown template id'
      end
    end

    def self.get_template_id_map(version="r1")
      read_template_id_map(version)
    end

    private

    def self.read_template_id_map(version)
      HealthDataStandards::Util::HQMFTemplateHelper.template_id_map(version)
    end

    def normalize_status(definition, status)
      return status if status.nil?
      case status.downcase
        when 'completed', 'complete'
          case definition
            when 'diagnosis'
              'active'
            else
              'performed'
            end
        when 'order'
          'ordered'
        else
          status.downcase
      end
    end

    def self.convert_value(json)
      return nil unless json.present?
      type = json["type"]
      case type
        when 'TS', 'PQ'
          value = HQMF::Value.from_json(json)
        when 'IVL_PQ', 'IVL_TS'
          value = HQMF::Range.from_json(json)
        when 'CD'
          value = HQMF::Coded.from_json(json)
        when 'ANYNonNull'
          value = HQMF::AnyValue.from_json(json)
        when 'FLFS'
          value = HQMF::TypedReference.from_json(json)
        when 'ACT'
          # Currentlty forcing this as the SimpleXML reresentation contains a fulfills for these types
          value = HQMF::TypedReference.new(json["reference"], 'FLFS', '')
        else
          raise "Unknown value type [#{type}]"
        end
      value
    end


  end

end
