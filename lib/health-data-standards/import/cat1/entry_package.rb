module HealthDataStandards
  module Import
    module Cat1
      class EntryPackage

        attr_accessor :importer_type, :hqmf_oid, :status

        def initialize (type, oid, stat = nil)
          self.importer_type = type
          self.hqmf_oid = oid
          self.status = stat
        end  

        def package_entries (doc, nrh)
          entries = self.importer_type.create_entries(doc, nrh)
          entries_to_add = []
          entries_to_delete = []
          entries.each_with_index do |entry, index|
            if self.hqmf_oid.kind_of?(Array)
              self.hqmf_oid.each do |hqmf_oid|
                entry_copy = entry.clone
                entry_copy.oid = hqmf_oid
                entry_copy.status = self.status
                entry_copy.cda_identifier['extension'] = entry_copy.id.to_s
                entries_to_add << entry_copy
              end
              entries_to_delete << entry
            else
              entry.oid = self.hqmf_oid
              entry.status = self.status
            end
          end
          entries.concat(entries_to_add) - entries_to_delete
        end
      end
    end
  end
end