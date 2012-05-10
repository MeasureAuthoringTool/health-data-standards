module HealthDataStandards
  module Export
    module Hdata
      module Metadata
        include TemplateHelper

        def export(entry, metadata)
          self.template_format = "hdata"
          render(:template => 'metadata', :locals => {entry: entry, metadata: metadata})
        end
        
        extend self
      end
    end
  end
end