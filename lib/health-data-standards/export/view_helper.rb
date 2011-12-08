module HealthDataStandards
  module Export
    module ViewHelper
      def code_display(entry, options={})
        options['tag_name'] ||= 'code'
        code_string = nil
        preferred_code = entry.preferred_code(options['preferred_code_sets'])
        if preferred_code
          code_system_oid = QME::Importer::CodeSystemHelper.oid_for_code_system(preferred_code['code_set'])
          code_string = "<#{options['tag_name']} code=\"#{preferred_code['code']}\" codeSystem=\"#{code_system_oid}\" #{options['extra_content']}>"
        else
          code_string = "<#{options['tag_name']} nullFlavor=\"UNK\" #{options['extra_content']}>"
        end
        code_string += "<originalText>#{ERB::Util.html_escape entry.description}</originalText>"
        entry.translation_codes(options['preferred_code_sets']).each do |translation|
          code_string += "<translation code=\"#{translation['code']}\" codeSystem=\"#{QME::Importer::CodeSystemHelper.oid_for_code_system(translation['code_set'])}\"/>\n"
        end
        code_string += "</#{options['tag_name']}>"
        code_string
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