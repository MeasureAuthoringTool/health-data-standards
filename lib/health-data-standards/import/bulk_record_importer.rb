require 'fileutils'
module HealthDataStandards
  module Import
    class BulkRecordImporter

      def self.import_directory(source_dir, failed_dir=nil)
        failed_dir ||= File.join(source_dir, '../', 'failed_imports')
        files = Dir.glob(File.join(source_dir, '*.*'))
        files.each do |file|
	   self.import_file(file,File.new(file).read,failed_dir)
        end
      end

      def self.import_archive(file, failed_dir=nil)
        begin
        failed_dir ||=File.join(File.dirname(file))

        patient_id_list = nil

        Zip::ZipFile.open(file.path) do |zipfile|
          zipfile.entries.each do |entry|
            if entry.name
              if entry.name.split("/").last == "patient_manifest.txt"
                patient_id_list = zipfile.read(entry.name)
                next
              end
            end
            next if entry.directory?
            data = zipfile.read(entry.name)
	    self.import_file(entry.name,data,failed_dir)
          end
        end

        missing_patients = []

        #if there was a patient manifest, theres a patient id list we need to load
        if patient_id_list
          patient_id_list.split("\n").each do |id|
            patient = Record.where(:medical_record_number => id).first
            if patient == nil
              missing_patients << id
            end
          end
        end

        missing_patients

      rescue
        FileUtils.mkdir_p(failed_dir)
        FileUtils.cp(file,File.join(failed_dir,File.basename(file)))
        File.open(File.join(failed_dir,"#{file}.error")) do |f|
          f.puts($!.message)
          f.puts($!.backtrace)
        end
        raise $!
      end
      end

      def self.import_file(name,data,failed_dir,provider_map={})
        begin
          ext = File.extname(name)
          if ext == ".json"
	    self.import_json(data)
          else
	    self.import(data)
          end
        rescue
          FileUtils.mkdir_p(File.dirname(File.join(failed_dir,name)))
          File.open(File.join(failed_dir,name),"w") do |f|
            f.puts(data)
          end
          File.open(File.join(failed_dir,"#{name}.error"),"w") do |f|
            f.puts($!.message)
            f.puts($!.backtrace)
          end
        end
      end

      def self.import_json(data,provider_map = {})
        json = JSON.parse(data,:max_nesting=>100)
        record = Record.update_or_create(Record.new(json))
        providers = record.provider_performances
        providers.each do |prov|
          prov.provider.ancestors.each do |ancestor|
            record.provider_performances.push(ProviderPerformance.new(start_date: prov.start_date, end_date: prov.end_date, provider: ancestor))
          end
        end
        record.save!
      end

      def self.import(xml_data, provider_map = {})
        doc = xml_data.kind_of?(Nokogiri::XML::Document) ? xml_data : Nokogiri::XML(xml_data)

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

          record = Record.update_or_create(patient_data)

          begin
            providers = CDA::ProviderImporter.instance.extract_providers(doc, record)
          rescue Exception => e
            STDERR.puts "error extracting providers"
          end
        else
          return {status: 'error', message: 'Unknown XML Format', status_code: 400}
        end

        record.provider_performances = providers
        providers.each do |prov|
          prov.provider.ancestors.each do |ancestor|
            record.provider_performances.push(ProviderPerformance.new(start_date: prov.start_date, end_date: prov.end_date, provider: ancestor))
          end
        end
        if record.save
          return record
        end
      end
    end
  end
end
