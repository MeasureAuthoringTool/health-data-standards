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
          entries.each do |entry|
            # This stores/sets the negated/non-negated hqmf_oid by checking negation_ind=true(This caused errors while Cypress testing)
            # This will thus handle proper matching while looking for entries and later the exporting of proper entries/templates
            # It supposes We keep non-negated hqmf_oid as default in patient importer for different sections (in lib/health-data-standards/import/cat1/patient_importer.rb)
            entry.oid = entry.negation_ind ? negate_oid(self.hqmf_oid) : self.hqmf_oid
            entry.status = self.status
          end          
          entries
        end

        # This changes the last part of hqmf_oid to negate it by adding 100 to it
        # Example: 2.16.840.1.113883.3.560.1.6 will be changed to its negation 2.16.840.1.113883.3.560.1.106
        def negate_oid(hqmf_oid)
          neg_hqmf_oid = hqmf_oid.sub(/\d+\Z/) {|x| x.to_i + 100}
          HealthDataStandards.logger.warn("Negation of #{hqmf_oid} is #{neg_hqmf_oid} has been set")
          neg_hqmf_oid
        end

      end
    end
  end
end