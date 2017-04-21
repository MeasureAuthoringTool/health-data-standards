module HealthDataStandards
  module Import
    module Cat1
      class EntryPackage

        attr_accessor :importer_type, :hqmf_oid, :status
        include HealthDataStandards::Util

        def initialize (type, oid, stat = nil)
          self.importer_type = type
          self.hqmf_oid = oid
          self.status = stat
        end  

        def package_entries (doc, nrh)
          entries = self.importer_type.create_entries(doc, nrh)
          entries.each do |entry| 
            entry.oid = self.hqmf_oid
            entry.status = self.status if self.status
            if entry.negationInd
                oid_status = (entry.status || "")
                oid_definition = entry._type.to_s.downcase 
                oid_definition = entry.direction if (entry._type.to_s.downcase == "communication" && entry.direction)
                oid_definition = "diagnosis" if entry._type.to_s.downcase == "condition" 
                entry.oid = (HQMFTemplateHelper.template_id_by_definition_and_status(oid_definition, oid_status, entry.negationInd) || self.hqmf_oid)
            end
          end          
          entries
        end
      end
    end
  end
end