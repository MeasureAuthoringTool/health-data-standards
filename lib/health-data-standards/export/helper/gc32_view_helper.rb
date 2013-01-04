module HealthDataStandards
  module Export
    module Helper
      module GC32ViewHelper
        def gc32_effective_time(entry)
          if entry.time
            "<effectiveTime value=\"#{Time.at(entry.time).to_formatted_s(:number)}\" />"
          elsif entry.start_time || entry.end_time
            time = "<effectiveTime>"
            time += "<start value=\"#{Time.at(entry.start_time).to_formatted_s(:number)}\" />"  if entry.start_time
            time += "<end value=\"#{Time.at(entry.end_time).to_formatted_s(:number)}\" />" if entry.end_time
            time += "</effectiveTime>"
          else
            "<effectiveTime />"
          end
        end
      end
    end
  end
end