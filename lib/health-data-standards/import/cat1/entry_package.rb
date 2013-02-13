module HealthDataStandards
  module Import
    module Cat1
      class EntryPackage

        attr_accessor :importer_type, :hqmf_oid, :status, :entry

        def initialize (doc, type = nil, oid = nil, stat = nil)
          self.importer_type = type
          self.hqmf_oid = oid
          self.status = stat
          nrh = CDA::NarrativeReferenceHandler.new
          nrh.build_id_map(doc)
          entries = self.importer_type.create_entries(doc, nrh)
          if !entries.empty?
            entries[0].oid = self.hqmf_oid
            entries[0].status = self.status
            self.entry = entries[0]
          end
        end  
        
      end
    end
  end
end