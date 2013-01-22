module HealthDataStandards
  module Import
    module CDA
      class NarrativeReferenceHandler
        def initialize
          @id_map = {}
        end

        def build_id_map(doc)
          path = "//*[@ID]"
          ids = doc.xpath(path)
          ids.each do |id|
            tag = id['ID']
            value = id.content
            @id_map[tag] = value
          end
        end

        # @param [String] tag      
        # @return [String] text description of tag
        def lookup_tag(tag)
          value = @id_map[tag]
          # Not sure why, but sometimes the reference is #<Reference> and the ID value is <Reference>, and 
          # sometimes it is #<Reference>.  We look for both.
          if !value and tag[0] == '#'  
           tag = tag[1,tag.length]
           value = @id_map[tag]
          end

          value
        end
      end
    end
  end
end