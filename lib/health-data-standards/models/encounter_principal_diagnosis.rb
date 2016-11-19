class EncounterPrincipalDiagnosis
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :encounter, class_name: "Encounter", inverse_of: nil
  
  def preferred_code(preferred_code_sets=nil, codes_attribute=nil, value_set_map=nil)
    if @attributes.key?('code') and @attributes.key?('code_system')
      # This encounter principal diagnosis has the standard 'code' and
      # 'code_system' attributes, so only one code possible.
      return {'code' => @attributes['code'], 'code_set' => @attributes['code_system']}
    elsif @attributes.key?('codes')
      # This encounter principal diagnosis has the special 'codes' attribute
      # set, so return the first code in the first code set.
      code_set, code_set_codes = @attributes['codes'].first
      return {'code' => code_set_codes.first, 'code_set' => code_set}
    end
  end

  def translation_codes(preferred_code_sets=nil ,value_set_map=nil)
    tx_codes = []
    # Translations are only necessary when the encounter principal diagnosis
    # contains the special 'codes' attribute rather than the normal 'code' and
    # 'code_system', as 'codes' supports multiple codes/code sets.
    if @attributes.key?('codes')
      @attributes['codes'].each do |code_set, code_set_codes|
        for code in code_set_codes
          tx_codes.push({'code' => code, 'code_set' => code_set})
        end
      end
      tx_codes.shift
    end
    tx_codes
  end

end
