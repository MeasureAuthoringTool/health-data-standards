module HealthDataStandards
  module Export
    module ViewHelper
      def code_display(entry, options={})
        options['tag_name'] ||= 'code'
        options['attribute'] ||= :codes
        code_string = nil
        preferred_code = entry.preferred_code(options['preferred_code_sets'], options['attribute'])
        if preferred_code
          code_system_oid = HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(preferred_code['code_set'])
          code_string = "<#{options['tag_name']} code=\"#{preferred_code['code']}\" codeSystem=\"#{code_system_oid}\" #{options['extra_content']}>"
        else
          code_string = "<#{options['tag_name']} nullFlavor=\"UNK\" #{options['extra_content']}>"
        end
        
        
        
        if options["attribute"] == :codes && entry.respond_to?(:translation_codes)
          code_string += "<originalText>#{ERB::Util.html_escape entry.description}</originalText>" if entry.respond_to?(:description)
          entry.translation_codes(options['preferred_code_sets']).each do |translation|
            code_string += "<translation code=\"#{translation['code']}\" codeSystem=\"#{HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(translation['code_set'])}\"/>\n"
          end
        end
        
        code_string += "</#{options['tag_name']}>"
        code_string
      end
      
      def gc32_effective_time(entry)
        if entry.time
          "<effectiveTime value=\"#{Time.at(entry.time).xmlschema}\" />"
        elsif entry.start_time || entry.end_time
          gc32_interval(entry, "effectiveTime", :start_time, :end_time)
        else
          "<effectiveTime />"
        end
      end
      
      def gc32_interval(entry, tag_name, start_attribute, end_attribute)
        time = "<#{tag_name}>"
        time += "<start value=\"#{Time.at(entry.send(start_attribute)).xmlschema}\" />"  if entry.send(start_attribute)
        time += "<end value=\"#{Time.at(entry.send(end_attribute)).xmlschema}\" />" if entry.send(end_attribute)
        time += "</#{tag_name}>"
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

           
      def value_or_null_flavor(time)
        if time 
          return "value='#{Time.at(time).utc.to_formatted_s(:number)}'"
        else 
         return "nullFlavor='UNK'"
       end
      end

      
      def quantity_display(value, tag_name="value")
        return unless value
        if value.respond_to?(:scalar)
          "<#{tag_name} amount=\"#{value.scalar}\" unit=\"#{value.units}\" />"
        else
          "<#{tag_name} amount=\"#{value['value']}\" unit=\"#{value['unit']}\" />"
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
    end
  end
end