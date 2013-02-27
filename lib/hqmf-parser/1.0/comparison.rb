module HQMF1
  class Comparison
  
    include HQMF1::Utilities
    
    attr_reader :restrictions, :data_criteria_id, :title, :subset
    
    def initialize(data_criteria_id, entry, parent, doc)
      @doc = doc
      @data_criteria_id = data_criteria_id
      @entry = entry
      title_def = @entry.at_xpath('./*/cda:title')
      if title_def
        @title = title_def.inner_text
      end
      @restrictions = []
      restriction_def = @entry.at_xpath('./*/cda:sourceOf')
      if restriction_def
        @entry.xpath('./*/cda:sourceOf').each do |restriction|
          @restrictions << Restriction.new(restriction, self, @doc)
        end
      end
    end
    
    def to_json
      
      json = build_hash(self, [:data_criteria_id,:title,:subset])
      json[:restrictions] = json_array(@restrictions)
      json
      
    end
    
  end
end