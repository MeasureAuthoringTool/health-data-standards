module HealthDataStandards
  module Export
    module ViewHelper
      def code_display(entry, options={})
        options['tag_name'] ||= 'code'
        options['attribute'] ||= :codes
        options['exclude_null_flavor'] ||= false
        # allowing wild card matching of any code system for generic templates
        # valueset filtering should filter out a decent code
        pcs = if options['preferred_code_sets'] && options['preferred_code_sets'].index("*")
          # all of the code_systems that we know about
          HealthDataStandards::Util::CodeSystemHelper::CODE_SYSTEMS.values | HealthDataStandards::Util::CodeSystemHelper::CODE_SYSTEM_ALIASES.keys
        else
          options['preferred_code_sets']
        end
        create_code_string(entry, entry.preferred_code(pcs, options['attribute'], options['value_set_map']), options)
      end

      def create_code_string(entry, preferred_code, options={})
        
        code_string = create_code_display_string(entry, preferred_code, options)
        
        code_string += "<originalText>#{ERB::Util.html_escape entry.description}</originalText>" if entry.respond_to?(:description)

        code_string += create_laterality_code_string(entry, options) if options["laterality"]
        
        code_string += create_translations_code_string(entry, options) if options["attribute"] == :codes && entry.respond_to?(:translation_codes)
        
        code_string += "</#{options['tag_name']}>"

        code_string
      end

      def create_code_display_string(entry, preferred_code, options={})
        code_string = nil
        if preferred_code
          code_system_oid = HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(preferred_code['code_set'])
          code_string = "<#{options['tag_name']} code=\"#{preferred_code['code']}\" codeSystem=\"#{code_system_oid}\" #{options['extra_content']}>"
        else
          code_string = "<#{options['tag_name']} "
          code_string += "nullFlavor=\"UNK\" " unless options["exclude_null_flavor"]
          code_string += "#{options['extra_content']}>"
        end
        code_string
      end

      def create_laterality_code_string(entry, options={})
        code_string = "\n<!-- QDM Attribute: Laterality -->\n<qualifier>\n<name code='182353008' codeSystem='2.16.840.1.113883.6.96' displayName='Side' />\n"
        code_string += "<value xsi:type='CD' code='#{options['laterality']['code']}' displayName='#{options['laterality']['title']}' sdtc:valueSet='#{oid_for_code(entry.laterality,field_oids['LATERALITY'])}'
                       codeSystem='#{HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(options['laterality']['code_system'])}'/>\n</qualifier>\n"
      end

      def create_translations_code_string(entry, options={})
        code_string = ''
        entry.translation_codes(options['preferred_code_sets'], options['value_set_map']).each do |translation|
          code_string += "<translation code=\"#{translation['code']}\" codeSystem=\"#{HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(translation['code_set'])}\"/>\n"
        end
        code_string
      end

      def status_code_for(entry)
        case entry.status.to_s.downcase
        when 'active'
          '55561003'
        when 'inactive'
          '73425007'
        when 'resolved'
          '413322009'
        end
      end

      def fulfillment_quantity(codes, fulfillmentHistory, dose)
        if (codes["RxNorm"].present?)
          doses = (fulfillmentHistory.quantity_dispensed['value'].to_f / dose['value'].to_f ).to_i
          return "value='#{doses}' unit='1'"
        else
          return "value='#{fulfillmentHistory.quantity_dispensed['value']}' unit='#{fulfillmentHistory.quantity_dispensed['unit']}'"
        end
      end
           
      def value_or_null_flavor(time)
        if time 
          return "value='#{Time.at(time).utc.to_formatted_s(:number)}'"
        else 
         return "nullFlavor='UNK'"
       end
      end

      def dose_quantity(codes, dose)
        if (codes["RxNorm"].present? || codes["CVX"].present?)
          if dose['unit'].present?
            return "value='1' unit='#{ucum_for_dose_quantity(dose['unit'])}'"
          else
            return "value='1'"
          end
        else
          return "value='#{dose['scalar']}' unit='#{dose['units']}'"
        end
      end

      def ucum_for_dose_quantity(unit)
        case unit
        when 'capsule(s)'
          '{Capsule}'
        when 'tablet(s)'
          '{tbl}'
        else
          unit
        end
      end

      def ucum_for_dose_quantity(unit)
        case unit
        when 'capsule(s)'
          '{Capsule}'
        when 'tablet(s)'
          '{tbl}'
        else
          unit
        end
      end

      def time_if_not_nil(*args)
        args.compact.map {|t| Time.at(t).utc}.first
      end
      
      def is_num?(str)
        Float(str || "")
      rescue ArgumentError
        false
      else
        true
      end
      
      def is_bool?(str)
        return ["true","false"].include? (str || "").downcase
      end

      def identifier_for(obj)
        Digest::MD5.hexdigest(obj.to_s).upcase
      end
      
      def convert_field_to_hash(field, codes)
        if codes.is_a? Array
          return codes.collect{ |code| convert_field_to_hash(field, convert_field_to_hash(field, code))}.join("<br>")
        end

        if (codes.is_a? Hash)
          clean_hash = {}

          if codes['codeSystem']
            clean_hash[codes['codeSystem']] = clean_hash_code_system(codes)
          elsif codes['_id']
            codes.keys.reject {|key| ['_id'].include? key}.each do |hashkey|
              clean_hash[hashkey.titleize] = clean_hash_id(codes)
            end
          elsif codes['scalar']
            return "#{codes['scalar']} #{codes['units']}"
          else
            return codes.map do |hashcode_set, hashcodes| 
              if hashcodes.is_a? Hash
                "#{hashcode_set}: #{convert_field_to_hash(hashcode_set, hashcodes)}"
              else
                "#{hashcode_set}: #{(hashcodes.respond_to? :join) ? hashcodes.join(', ') : hashcodes.to_s}"
              end
            end.join(' ')
          end
            
          clean_hash
        else
          if codes && (field.match(/Time$/) || field.match(/\_time$/) || field.match(/Date$/)) 
            Entry.time_to_s(codes)
          else
            codes.to_s
          end
        end
      end
      
      def clean_hash_code_system(codes)
        if codes['title']
          return codes['code'] + " (#{codes['title']})"
        else
          return codes['code']
        end
      end
      
      def clean_hash_id(codes)
        value = codes[hashkey]
        if value.nil?
          return 'none'
        elsif value.is_a? Hash
          hash_result = convert_field_to_hash(hashkey, value)
          if hash_result.is_a? Hash
            return hash_result.map {|key, value| "#{key}: #{value}"}.join(' ')
          else
            return hash_result
          end
        elsif value.is_a? Array
          return value.join(', ')
        else
          return convert_field_to_hash(hashkey, value)
        end
      end
      
      
    end
  end
end
