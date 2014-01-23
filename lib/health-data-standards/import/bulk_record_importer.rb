require 'fileutils'
module HealthDataStandards
  module Import
    class BulkRecordImporter

      def self.import_directory(source_dir)

        xml_files = Dir.glob(File.join(source_dir, '*.*'))
        xml_files.each do |file|
          begin
            
            result = RecordImporter.import(File.new(file).read, provider_map)
            
            if (result[:status] == 'success') 
              record = result[:record]
              record.save
            else 
              assert result[:message]
            end
            
          rescue Exception => e
            failed_dir = File.join(source_dir, '../', 'failed_imports')
            unless(Dir.exists?(failed_dir))
              Dir.mkdir(failed_dir)
            end
            FileUtils.cp(file, failed_dir)
          end
        end
      end
      
      def self.import_archive(file) 
        Zip::ZipFile.open(file.path) do |zipfile|
          zipfile.entries.each do |entry|
            next if entry.directory?
            xml = zipfile.read(entry.name)
            begin
              BulkRecordImporter.import(xml)
            rescue Exception => e
              failed_dir = File.join(file.dirname, 'failed_imports')
              unless(Dir.exists?(failed_dir))
                Dir.mkdir(failed_dir)
              end
              FileUtils.cp(file, failed_dir)
            end
          end
        end
      end
      
      def self.import(xml_data, provider_map = {})
        doc = Nokogiri::XML(xml_data)
        
        providers = []
        root_element_name = doc.root.name
        
        if root_element_name == 'ClinicalDocument'
          doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
          doc.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')

          if doc.at_xpath("/cda:ClinicalDocument/cda:templateId[@root='2.16.840.1.113883.3.88.11.32.1']")
            patient_data = C32::PatientImporter.instance.parse_c32(doc)
          elsif doc.at_xpath("/cda:ClinicalDocument/cda:templateId[@root='2.16.840.1.113883.10.20.22.1.2']")
            patient_data = CCDA::PatientImporter.instance.parse_ccda(doc)
          elsif doc.at_xpath("/cda:ClinicalDocument/cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2']")
            patient_data = Cat1::PatientImporter.instance.parse_cat1(doc)
          else
            STDERR.puts("Unable to determinate document template/type of CDA document")
            return {status: 'error', message: "Document templateId does not identify it as a C32 or CCDA", status_code: 400}
          end
          
          begin
            providers = CDA::ProviderImporter.instance.extract_providers(doc)
          rescue Exception => e
            STDERR.puts "error extracting providers"
          end
        else
          return {status: 'error', message: 'Unknown XML Format', status_code: 400}
        end

        record = Record.update_or_create(patient_data)
        record.provider_performances = providers
        record.save
        
        {status: 'success', message: 'patient imported', status_code: 201, record: record}

      end
    end
  end
end
