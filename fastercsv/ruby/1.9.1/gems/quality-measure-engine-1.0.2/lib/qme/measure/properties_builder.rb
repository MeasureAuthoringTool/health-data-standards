module QME
  module Measure
  
    # Utility class for converting JSONified XLS file to measure properties
    class PropertiesBuilder
    
      GROUPING = 'GROUPING'
      STANDARD_TAXONOMY = 'standard_taxonomy'
      STANDARD_CODE_LIST = 'standard_code_list'
      STANDARD_CONCEPT = 'standard_concept'
      STANDARD_CONCEPT_ID = 'standard_concept_id'
      STANDARD_CATEGORY = 'standard_category'
      QDS_DATA_TYPE = 'QDS_data_type'
      PROPERTIES_TO_IGNORE = %w(birthdate measurement_enddate measurement_period)
      
      # Convert JSONified measure XLS to measure properties format
      def self.build_properties(xls_json, xls_file)
        xls_json = patch_properties(xls_json, xls_file)
        
        # build groupings
        grouped_json = build_groups(xls_json)
        
        properties = {}
        grouped_json.each do |value|
          property_value = build_property(value)
          if !PROPERTIES_TO_IGNORE.include?(property_value[STANDARD_CONCEPT])
            properties[property_name(value)] = property_value
          end
        end
        
        {'measure' => properties}
      end
      
      # Build the top-level JSON hash for a measure property
      def self.build_property(parent)
        property = {}
        property[STANDARD_CONCEPT] = build_underscore_separated_name(parent[STANDARD_CONCEPT])
        property[STANDARD_CATEGORY] = build_underscore_separated_name(parent[STANDARD_CATEGORY])
        property[STANDARD_CONCEPT_ID] = parent[STANDARD_CONCEPT_ID]
        property['qds_data_type'] = build_underscore_separated_name(parent[QDS_DATA_TYPE])
        property['qds_id'] = parent['QDS_id']
        property['type'] = 'array'
        property['items'] = build_item_def(parent)
        property['codes'] = build_code_list(parent)
        property
      end
      
      # Build the definition of a property item
      def self.build_item_def(property)
        if property['value']
          {
            'type' => 'object',
            'properties' => {
              'value' => {
                'description' => property['value']['description'],
                'type' => property['value']['type']
              },
              'date' => {
                'description' => property['value']['date_description'],
                'type' => 'number',
                'format' => 'utc-sec'
              }
            }
          }
        elsif property['range']
          {
            'type' => 'object',
            'properties' => {
              'start' => {
                'description' => property['range']['start_description'],
                'type' => 'number',
                'format' => 'utc-sec'
              },
              'end' => {
                'description' => property['range']['end_description'],
                'type' => 'number',
                'format' => 'utc-sec'
              }
            }
          }
        else
          {
            'type' => 'number',
            'format' => 'utc-sec'
          }
        end
      end
      
      # Build the set of code lists for a property
      def self.build_code_list(property)
        if property['child_nodes']
          property['child_nodes'].collect { |item| build_code_def(item) }
        else
          [build_code_def(property)]
        end
      end
      
      # Build a single code list JSON hash for a property
      def self.build_code_def(property)
        {
          'set' => property['standard_taxonomy'],
          'version' => property['standard_taxonomy_version'],
          STANDARD_CONCEPT => build_underscore_separated_name(property[STANDARD_CONCEPT]),
          STANDARD_CONCEPT_ID => property[STANDARD_CONCEPT_ID],
          'qds_id' => property['QDS_id'],
          'values' => extract_code_values(property['standard_code_list'], property['standard_taxonomy'])
        }
      end
      
      # Extract the code values from their string form into an array of strings, one per code
      def self.extract_code_values(string_list, set)
        return [] if string_list==nil || string_list.length==0
        string_list.split(',').collect do |entry|
          if set=='CPT' && entry.include?('-')
            # special handling for ranges in CPT code sets, e.g. 10010-10015
            eval(entry.strip.gsub('-','..')).to_a.collect { |i| i.to_s }
          else
            entry.strip
          end
        end.flatten
      end
      
      # Generate a property name from the standard concept and qds data type
      def self.property_name(property)
        build_underscore_separated_name(property[STANDARD_CONCEPT], property[QDS_DATA_TYPE])
      end
      
      # Break all the supplied strings into separate words and return the resulting list as a
      # new string with each word separated with '_'
      def self.build_underscore_separated_name(*components)
        name = []
        components.each do |component|
          name.concat component.gsub(/\W/,' ').split.collect { |word| word.strip.downcase }
        end
        name.join '_'
      end
      
      # build an array of grouped properties
      def self.build_groups(xls_json)
        grouped_json = []
        exclude_child_ids = []
        
        # add grouped members
        groups = xls_json.values.select { |value| value[STANDARD_TAXONOMY]!=nil && value[STANDARD_TAXONOMY].upcase==GROUPING }
        groups.each do |group|
          group_child_ids = group[STANDARD_CODE_LIST].split(',').collect { |id| id.strip }
          children = xls_json.values.select do |child| 
            group_child_ids.include?(child[STANDARD_CONCEPT_ID].strip)
          end
          group['child_nodes'] = children
          grouped_json << group
          if group['group_type']==nil || group['group_type']!='abstract'
            exclude_child_ids.concat group_child_ids
          end
        end

        # add remaining non-grouped members
        xls_json.values.each do |value|
          if value[STANDARD_TAXONOMY]!=GROUPING && !exclude_child_ids.include?(value[STANDARD_CONCEPT_ID].strip)
            grouped_json<<value
          end
        end
        grouped_json
      end
      
      # Patch the supplied property_json hash with the contents of a patch file named
      # "#{property_file}.patch" and return the result
      def self.patch_properties(property_json, property_file)
        patch_file = "#{property_file}.patch"
        
        if File.exists? patch_file
          patch_json = JSON.parse(File.read(patch_file))
        
          property_json = property_json.merge(patch_json) do |key, old, new|
            old.merge(new)
          end
        end
        property_json
      end
      
    end
      
  end
end