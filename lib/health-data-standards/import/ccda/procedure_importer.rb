module HealthDataStandards
  module Import
    module CCDA
      class ProcedureImporter < CDA::ProcedureImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7.1']/cda:entry/cda:*"))
        end

      end
    end
  end
end