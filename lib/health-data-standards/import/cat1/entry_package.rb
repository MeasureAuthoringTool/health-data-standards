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
                definition = HQMFTemplateHelper.definition_for_template_id(self.hqmf_oid)
                entry.oid = HQMFTemplateHelper.template_id_by_definition_and_status(definition["definition"], definition["status"], true) if definition
            end
          end          
          entries
        end
      end
    end
  end
end