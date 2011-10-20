module HealthDataStandards
  module Export
    module ViewHelper
      def code_display(entry, tag_name='code', extra_content=nil)
        if entry.single_code_value?
          code = entry.codes.first[1].first
          code_system_oid = QME::Importer::CodeSystemHelper.oid_for_code_system(entry.codes.first[0])
          "<#{tag_name} code=\"#{code}\" codeSystem=\"#{code_system_oid}\" #{extra_content}><originalText>#{entry.description.html_safe}</originalText></#{tag_name}>"
        else
          all_codes = []
          entry.codes.each_pair {|key, values| values.each {|v| all_codes << {:set => key, :value => v}}}
          first_code = all_codes.first
          code_string = "<#{tag_name} code=\"#{first_code[:value]}\" codeSystem=\"#{QME::Importer::CodeSystemHelper.oid_for_code_system(first_code[:set])}\">\n"
          code_string += "<originalText>#{entry.description.html_safe}</originalText>\n"
          all_codes[1..-1].each do |cv|
            code_string += "<translation code=\"#{cv[:value]}\" codeSystem=\"#{QME::Importer::CodeSystemHelper.oid_for_code_system(cv[:set])}\"/>\n"
          end
          code_string += "</#{tag_name}>"
          code_string
        end
      end
      
      def status_code_for(entry)
        case entry.status.to_s
        when 'active'
          '55561003'
        when 'inactive'
          '73425007'
        when 'resolved'
          '413322009'
        end
      end      
    end
  end
end