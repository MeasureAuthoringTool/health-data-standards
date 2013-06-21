module HealthDataStandards
  module Export
    module QRDA
      module EntryTemplateResolver
        def hqmf_qrda_oid_map
          if @hqmf_qrda_oid_map.blank?
            template_id_file = File.expand_path('../hqmf-qrda-oids.json', __FILE__)
            @hqmf_qrda_oid_map = JSON.parse(File.read(template_id_file))  
          end
          @hqmf_qrda_oid_map
        end

        def qrda_oid_exist?(oid)
          hqmf_qrda_oid_map.any? {|map_tuple| map_tuple['qrda_oid'] == oid}
        end

        def qrda_oid_for_hqmf_oid(hqmf_oid, vs_oid = nil)

          if (vs_oid && hqmf_oid == '2.16.840.1.113883.3.560.1.1001')
            qrda_oid_for_hqmf_patient_characteristic(vs_oid)
          else
            oid_tuple = hqmf_qrda_oid_map.find {|map_tuple| map_tuple['hqmf_oid'] == hqmf_oid }
            if oid_tuple.nil?
              puts "no qrda oid for #{hqmf_oid}"
            end
            oid_tuple['qrda_oid']
          end

        end

        # given a value set oid for a patient characteristic, return the qrda oid for the correct characteristic
        def qrda_oid_for_hqmf_patient_characteristic(vs_oid)
          # This is a special case. This HQMF OID maps to more than one QRDA OID.
          # So we need to try to figure out what template we should use based on the
          # content of the entry
          if vs_oid == '2.16.840.1.113883.3.526.3.1279'
            # Patient Characteristic Observation Assertion template for
            # Patient Characteristic: ECOG Performance Status-Poor
            '2.16.840.1.113883.10.20.24.3.103'
          elsif ["2.16.840.1.113883.3.117.1.7.1.402" , "2.16.840.1.113883.3.117.1.7.1.403" , "2.16.840.1.113883.3.117.1.7.1.287" ,"2.16.840.1.113883.3.117.1.7.1.307"].index(vs_oid)
            # Patient Charasteristic Gestational Age
            '2.16.840.1.113883.10.20.24.3.101'
          elsif vs_oid == "2.16.840.1.113883.3.526.3.1189" || vs_oid == "2.16.840.1.113883.3.526.3.1170" || vs_oid == '2.16.840.1.113883.3.600.2390'
            # Patient Characteristic Tobacco User/Non-User
            '2.16.840.1.113883.10.20.22.4.85'
          end
        end

        alias :partial_for :qrda_oid_for_hqmf_oid

        extend self
      end
    end
  end
end