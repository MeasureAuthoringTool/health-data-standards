module HealthDataStandards
  module Import
    module Cat1
      class EntryPackage

        attr_accessor :importer_type, :hqmf_oid, :status

        def initialize (type = nil, oid = nil, stat = nil)
          self.importer_type = type
          self.hqmf_oid = oid
          self.status = stat
        end  

        def package_entries (doc, nrh)
          entries = self.importer_type.create_entries(doc, nrh)
          if entries.present?
            entries.map {|entry| entry.oid = self.hqmf_oid}
            entries.map {|entry| entry.status = self.status}
            entries
          end
        end
        
      end
    end
  end
end