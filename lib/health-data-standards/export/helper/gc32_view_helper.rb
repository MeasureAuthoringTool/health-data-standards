module HealthDataStandards
  module Export
    module Helper
      module GC32ViewHelper
        def gc32_code_display(entry, options={})
          code_display(entry, options.merge("exclude_null_flavor" => true))
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

        def quantity_display(value, tag_name="value")
          return unless value
          if value.respond_to?(:scalar)
            "<#{tag_name} amount=\"#{value.scalar}\" unit=\"#{value.units}\" />"
          elsif value['scalar'].present?
            "<#{tag_name} amount=\"#{value['scalar']}\" unit=\"#{value['units']}\" />"  
          else
            "<#{tag_name} amount=\"#{value['value']}\" unit=\"#{value['unit']}\" />"
          end
        end
      end
    end
  end
end