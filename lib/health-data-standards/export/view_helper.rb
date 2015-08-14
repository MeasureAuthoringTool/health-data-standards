module HealthDataStandards
  module Export
    module ViewHelper
      def code_display(entry, options={})
        options['tag_name'] ||= 'code'
        options['attribute'] ||= :codes
        options['exclude_null_flavor'] ||= false
        code_string = nil
        # allowing wild card matching of any code system for generic templates
        # valueset filtering should filter out a decent code
        pcs = if options['preferred_code_sets'] && options['preferred_code_sets'].index("*")
          # all of the code_systems that we know about
          HealthDataStandards::Util::CodeSystemHelper::CODE_SYSTEMS.values | HealthDataStandards::Util::CodeSystemHelper::CODE_SYSTEM_ALIASES.keys
        else
          options['preferred_code_sets']
        end

        preferred_code = entry.preferred_code(pcs, options['attribute'], options['value_set_map'])
        if preferred_code
          code_system_oid = HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(preferred_code['code_set'])
          code_string = "<#{options['tag_name']} code=\"#{preferred_code['code']}\" codeSystem=\"#{code_system_oid}\" #{options['extra_content']}>"
        else
          code_string = "<#{options['tag_name']} "
          code_string += "nullFlavor=\"UNK\" " unless options["exclude_null_flavor"]
          code_string += "#{options['extra_content']}>"
        end
        
        
        
        if options["attribute"] == :codes && entry.respond_to?(:translation_codes)
          code_string += "<originalText>#{ERB::Util.html_escape entry.description}</originalText>" if entry.respond_to?(:description)
          entry.translation_codes(options['preferred_code_sets'], options['value_set_map']).each do |translation|
            code_string += "<translation code=\"#{translation['code']}\" codeSystem=\"#{HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(translation['code_set'])}\"/>\n"
          end
        end
        
        code_string += "</#{options['tag_name']}>"
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
          return "value='#{doses}'"
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
        if (codes["RxNorm"].present?)
          return "value='1'"
        else
          return "value=#{dose['value']} unit=#{dose['unit']}" 
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
            if codes['title']
              clean_hash[codes['codeSystem']] = codes['code'] + " (#{codes['title']})"
            else
              clean_hash[codes['codeSystem']] = codes['code']
            end
          elsif codes['_id']
            codes.keys.reject {|key| ['_id'].include? key}.each do |hashkey|
              value = codes[hashkey]
              if value.nil?
                clean_hash[hashkey.titleize] = 'none'
              elsif value.is_a? Hash
                hash_result = convert_field_to_hash(hashkey, value)
                if hash_result.is_a? Hash
                  clean_hash[hashkey.titleize] = hash_result.map {|key, value| "#{key}: #{value}"}.join(' ')
                else
                  clean_hash[hashkey.titleize] = hash_result
                end
              elsif value.is_a? Array
                clean_hash[hashkey.titleize] = value.join(', ')
              else
                clean_hash[hashkey.titleize] = convert_field_to_hash(hashkey, value)
              end
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
      
      
    end
  end
end
