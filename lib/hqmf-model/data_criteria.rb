module HQMF
  # Represents a data criteria specification
  class DataCriteria

    include HQMF::Conversion::Utilities

    SOURCE_DATA_CRITERIA_TEMPLATE_ID = '2.16.840.1.113883.3.100.1.1'
    SOURCE_DATA_CRITERIA_TEMPLATE_TITLE = 'Source data criteria'
    
    XPRODUCT = 'XPRODUCT'
    UNION = 'UNION'

    FIELDS = {'SEVERITY' => {title:'Severity', coded_entry_method: :severity, code: 'SEV', code_system:'2.16.840.1.113883.5.4', template_id: '2.16.840.1.113883.3.560.1.1021.2', field_type: :value},
             'ORDINAL' => {title:'Ordinal', coded_entry_method: :ordinality, code: '117363000', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1012.2', field_type: :value},
             'REASON' => {title:'Reason', coded_entry_method: :reason, code: '410666004', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1017.2', field_type: :value},
             'SOURCE' => {title:'Source', coded_entry_method: :source, code: '260753009', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.2001.2', field_type: :value},
             'CUMULATIVE_MEDICATION_DURATION' => {title:'Cumulative Medication Duration', coded_entry_method: :cumulative_medication_duration, code: '363819003', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1001.3', field_type: :value},
             'FACILITY_LOCATION' => {title:'Facility Location', coded_entry_method: :facility, code: 'SDLOC', field_type: :value},
             'FACILITY_LOCATION_ARRIVAL_DATETIME' => {title:'Facility Location Arrival Date/Time', coded_entry_method: :facility_arrival, code: 'SDLOC_ARRIVAL', field_type: :nested_timestamp},
             'FACILITY_LOCATION_DEPARTURE_DATETIME' => {title:'Facility Location Departure Date/Time', coded_entry_method: :facility_departure, code: 'SDLOC_DEPARTURE', field_type: :nested_timestamp},
             'DISCHARGE_DATETIME' => {title:'Discharge Date/Time', coded_entry_method: :discharge_time, code: '442864001', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1025.1', field_type: :timestamp},
             'DISCHARGE_STATUS' => {title:'Discharge Status', coded_entry_method: :discharge_disposition, code: '309039003', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1003.2', field_type: :value},
             'ADMISSION_DATETIME' => {title:'Admission Date/Time', coded_entry_method: :admit_time, code: '399423000', code_system:'2.16.840.1.113883.6.96', field_type: :timestamp},
             'LENGTH_OF_STAY' => {title:'Length of Stay', coded_entry_method: :length_of_stay, code: '183797002', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1029.3', field_type: :value},
             'DOSE' => {title:'Dose', coded_entry_method: :dose, code: '398232005', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1004.1', field_type: :value},
             'ROUTE' => {title:'Route', coded_entry_method: :route, code: '263513008', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1020.2', field_type: :value},
             'START_DATETIME' => {title:'Start Date/Time', coded_entry_method: :start_date, code: '398201009', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1027.1', field_type: :timestamp},
             'FREQUENCY' => {title:'Frequency', coded_entry_method: :frequency, code: '260864003', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1006.1', field_type: :value},
             'ANATOMICAL_STRUCTURE' => {title:'Anatomical Structure', coded_entry_method: :anatomical_structure, code: '91723000', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1000.2', field_type: :value},
             'STOP_DATETIME' => {title:'Stop Date/Time', coded_entry_method: :end_date, code: '397898000', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1026.1', field_type: :timestamp},
             'INCISION_DATETIME' => {title:'Incision Date/Time', coded_entry_method: :incision_time, code: '34896006', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1007.1', field_type: :timestamp},
             'REMOVAL_DATETIME' => {title:'Removal Date/Time', coded_entry_method: :removal_time, code: '118292001', code_system:'2.16.840.1.113883.6.96', template_id: '2.16.840.1.113883.3.560.1.1032.1', field_type: :timestamp},
             'TRANSFER_TO' => {title:'Transfer To', coded_entry_method: :transfer_to, code: 'TRANSFER_TO', template_id: '2.16.840.1.113883.3.560.1.72', field_type: :value},
             'TRANSFER_FROM' => {title:'Transfer From', coded_entry_method: :transfer_from, code: 'TRANSFER_FROM', template_id: '2.16.840.1.113883.3.560.1.71', field_type: :value}
             }
             
    VALUE_FIELDS = {'SEV'      => 'SEVERITY',
                    '117363000' => 'ORDINAL',
                    '410666004' => 'REASON',
                    '260753009' => 'SOURCE',
                    '363819003' => 'CUMULATIVE_MEDICATION_DURATION',
                    'SDLOC'     => 'FACILITY_LOCATION',
                    '442864001' => 'DISCHARGE_DATETIME',
                    '309039003' => 'DISCHARGE_STATUS',
                    '399423000' => 'ADMISSION_DATETIME',
                    '183797002' => 'LENGTH_OF_STAY',
                    '398232005' => 'DOSE',
                    '263513008' => 'ROUTE',
                    '398201009' => 'START_DATETIME',
                    '260864003' =>'FREQUENCY',
                    '91723000'  => 'ANATOMICAL_STRUCTURE',
                    '397898000' => 'STOP_DATETIME',
                    '34896006'  => 'INCISION_DATETIME',
                    '118292001' =>'REMOVAL_DATETIME'
                   }
    

    attr_reader :title, :description, :code_list_id, :children_criteria, :derivation_operator , :specific_occurrence, :specific_occurrence_const, :source_data_criteria
    attr_accessor :id, :value, :field_values, :effective_time, :status, :temporal_references, :subset_operators, :definition, :inline_code_list, :negation_code_list_id, :negation, :display_name
  
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
    def initialize(id, title, display_name, description, code_list_id, children_criteria, derivation_operator, definition, status, value, field_values, effective_time, inline_code_list, negation, negation_code_list_id, temporal_references, subset_operators, specific_occurrence, specific_occurrence_const, source_data_criteria=nil)

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
    end
    
    # create a new data criteria given a category and sub_category.  A sub category can either be a status or a sub category
    def self.create_from_category(id, title, description, code_list_id, category, sub_category=nil, negation=false, negation_code_list_id=nil)
      settings = HQMF::DataCriteria.get_settings_for_definition(category, sub_category)
      HQMF::DataCriteria.new(id, title, nil, description, code_list_id, nil, nil, settings['definition'], settings['status'], nil, nil, nil, nil, negation, negation_code_list_id, nil, nil, nil,nil)
    end
    
    def standard_category
      @settings['standard_category']
    end
    def qds_data_type
      @settings['qds_data_type']
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

      HQMF::DataCriteria.new(id, title, display_name, description, code_list_id, children_criteria, derivation_operator, definition, status, value, field_values,
                             effective_time, inline_code_list, negation, negation_code_list_id, temporal_references, subset_operators,specific_occurrence,specific_occurrence_const,source_data_criteria)
    end

    def to_json
      json = base_json
      {self.id.to_s.to_sym => json}
    end

    def base_json
      x = nil
      json = build_hash(self, [:title,:display_name,:description,:standard_category,:qds_data_type,:code_list_id,:children_criteria, :derivation_operator, :property, :type, :definition, :status, :hard_status, :negation, :negation_code_list_id,:specific_occurrence,:specific_occurrence_const,:source_data_criteria])
      json[:children_criteria] = @children_criteria unless @children_criteria.nil? || @children_criteria.empty?
      json[:value] = ((@value.is_a? String) ? @value : @value.to_json) if @value
      json[:field_values] = @field_values.inject({}) {|memo,(k,v)| memo[k] = (!v.nil? ? v.to_json : nil); memo} if @field_values
      json[:effective_time] = @effective_time.to_json if @effective_time
      json[:inline_code_list] = @inline_code_list if @inline_code_list
      json[:temporal_references] = x if x = json_array(@temporal_references)
      json[:subset_operators] = x if x = json_array(@subset_operators)
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

    def self.get_settings_for_definition(definition, status)
      settings_file = File.expand_path('../data_criteria.json', __FILE__)
      settings_map = JSON.parse(File.read(settings_file))
      key = definition + ((status.nil? || status.empty?) ? '' : "_#{status}")
      settings = settings_map[key]
      
      raise "data criteria is not supported #{key}" if settings.nil? || settings["not_supported"]

      settings
    end

    def self.definition_for_template_id(template_id)
      get_template_id_map()[template_id]
    end

    def self.template_id_for_definition(definition, status, negation)
      get_template_id_map().key({'definition' => definition, 'status' => status || '', 'negation' => negation})
    end

    def self.title_for_template_id(template_id)
      value = get_template_id_map()[template_id]
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

    def self.get_template_id_map
      @@template_id_map ||= read_template_id_map
      @@template_id_map
    end
    
    private
    
    def self.read_template_id_map
      HealthDataStandards::Util::HQMFTemplateHelper.template_id_map
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
        when 'IVL_PQ'
          value = HQMF::Range.from_json(json)
        when 'CD'
          value = HQMF::Coded.from_json(json)
        when 'ANYNonNull'
          value = HQMF::AnyValue.from_json(json)
        else
          raise "Unknown value type [#{type}]"
        end
      value
    end


  end

end
