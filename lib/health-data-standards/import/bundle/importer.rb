require 'zip/zipfilesystem'
module HealthDataStandards
  module Import
    module Bundle

      class Importer

        SOURCE_ROOTS = {bundle: 'bundle.json',
                        libraries: File.join('library_functions','*.js'),
                        measures: 'measures', results: 'results',
                        valuesets: File.join('value_sets','json','*.json'),
                        patients: 'patients'}
        COLLECTION_NAMES = ["bundles", "records", "measures", "selected_measures", "patient_cache", "query_cache", "system.js"]
        CLEAR_ONLY_COLLECTIONS = ["system.js"]
        DEFAULTS = {type: nil,
                    delete_existing: false,
                    update_measures: true,
                    clear_collections: COLLECTION_NAMES
                  }

        # Import a quality bundle into the database. This includes metadata, measures, test patients, supporting JS libraries, and expected results.
        #
        # @param [File] zip The bundle zip file.
        # @param [String] Type of measures to import, either 'ep', 'eh' or nil for all
        # @param [Boolean] keep_existing If true, delete all current collections related to patients and measures.
        def self.import(zip,  options={})
          options = DEFAULTS.merge(options)

          bundle = nil
          Zip::ZipFile.open(zip.path) do |zip_file|

            bundle = unpack_bundle(zip_file)

            bundle_versions = Hash[* HealthDataStandards::CQM::Bundle.where({}).collect{|b| [b._id, b.version]}.flatten]
            if bundle_versions.invert[bundle.version] && !(options[:delete_existing])
              raise "A bundle with version #{bundle.version} already exists in the database. "
            end

            HealthDataStandards::CQM::Bundle.where({:version => bundle.version}).each do |b|
              puts "deleting existing bundle version: #{b.version}"
              b.delete
            end if options[:delete_existing]

            #find the highest bundle version and see if one is installed that is greater than the one
            # we are currently installing.  Do not load the libs other wise
            vers = bundle_versions.values.sort.reverse[0]
            if (vers.nil? || vers <= bundle.version || options["force_js_install"])
              unpack_and_store_system_js(zip_file)
            else
              puts "javascript libraries will not being updated as a more recent bundle version is already installed"
            end
            # Store the bundle metadata.
            unless bundle.save
              raise bundle.errors.full_messages.join(",")
            end
            puts "bundle metadata unpacked..."

            measure_ids = unpack_and_store_measures(zip_file, options[:type], bundle, options[:update_measures])
            unpack_and_store_patients(zip_file, options[:type], bundle) unless options[:exclude_results]
            unpack_and_store_valuesets(zip_file, bundle)
            unpack_and_store_results(zip_file, options[:type], measure_ids, bundle) unless options[:exclude_results]

          end

          return bundle
        ensure
          bundle.done_importing = true unless bundle.nil?
          bundle.save
        end


        # Save a javascript function into Mongo's system.js collection for measure execution.
        #
        # @param [String] name The name by which the function will be referred.
        # @param [String] fn The body of the function being saved.
        def self.save_system_js_fn(name, fn)
          fn = "function () {\n #{fn} \n }"
          Mongoid.default_session['system.js'].find('_id' => name).upsert(
            {
              "_id" => name,
              "value" => BSON::Code.new(fn)
            }
          )
        end

        # A utility function for finding files in a bundle. Strip a file path of it's extension and just give the filename.
        #
        # @param [String] original A file path.
        # @param [String] extension A file extension.
        # @return The filename at the end of the original String path with the extension removed. e.g. "/boo/urns.html" -> "urns"
        def self.entry_key(original, extension)
          original.split('/').last.gsub(".#{extension}", '')
        end

        def self.unpack_bundle(zip)
          HealthDataStandards::CQM::Bundle.new(JSON.parse(zip.read(SOURCE_ROOTS[:bundle]),max_nesting: 100))
        end

        def self.unpack_and_store_system_js(zip)
          zip.glob(SOURCE_ROOTS[:libraries]).each do |entry|
            name = Pathname.new(entry.name).basename('.js').to_s
            contents = entry.get_input_stream.read
            save_system_js_fn(name, contents)
          end
        end

        def self.unpack_and_store_measures(zip, type, bundle, update_measures)
          measure_ids = []
          entries = zip.glob(File.join(SOURCE_ROOTS[:measures],type || '**','*.json'))
          entries.each_with_index do |entry, index|
            source_measure = unpack_json(entry)
            # we clone so that we have a source without a bundle id
            measure = source_measure.clone
            measure_ids << measure['id']
            measure['bundle_id'] = bundle.id
            Mongoid.default_session["measures"].insert(measure)

            if update_measures
              Mongoid.default_session["measures"].where({hqmf_id: measure["hqmf_id"], sub_id: measure["sub_id"]}).each do |m|
                b = HealthDataStandards::CQM::Bundle.find(m["bundle_id"])
                if b.version < bundle.version
                  m.merge!(source_measure)
                  Mongoid.default_session["measures"].where({"_id" => m["_id"]}).update(m)
                end
              end
            end
            report_progress('measures', (index*100/entries.length)) if index%10 == 0
          end
          puts "\rLoading: Measures Complete          "
          measure_ids
        end

        def self.unpack_and_store_patients(zip, type, bundle)
          entries = zip.glob(File.join(SOURCE_ROOTS[:patients],type || '**','json','*.json'))
          entries.each_with_index do |entry, index|
            patient = Record.new(unpack_json(entry))
            patient['bundle_id'] = bundle.id

            #index
            source_data_with_references = Array.new
            source_data_reference_id_hash = Hash.new
            source_data_id_hash = Hash.new
            index = 0
            #loops through source data criteria, if there are references adds ids to hash
            patient['source_data_criteria'].each do |data_criteria|
              source_data_id_hash[data_criteria['criteria_id']] = index
              if data_criteria['references'] != nil
                source_data_with_references.push(index)
                reference_ids = Array.new
                data_criteria['references'].each do |reference|
                  reference_ids.push(reference['reference_id'])
                end
                source_data_reference_id_hash[data_criteria['criteria_id']] = reference_ids
              end
              index = index + 1
            end
            #if there are references, id references are reestablished
            if source_data_with_references.size > 0
              reconnect_references(patient, source_data_with_references, source_data_reference_id_hash, source_data_id_hash)
            end
            patient.save
            report_progress('patients', (index*100/entries.length)) if index%10 == 0
          end
          puts "\rLoading: Patients Complete          "
        end

        #bit of a hack here, equality is made by date and codes
        def self.compare_and_update_entries(patient, reference_id, start_date, end_date, codes)
          patient.entries.each do |entry|
            # if dates and codes match then replace id with original
            if compare_dates(entry, start_date, end_date)
              if entry.codes == codes
                entry._id = BSON::ObjectId.from_string(reference_id)
              end
            end
          end
        end

        def self.compare_dates(entry, start_date, end_date)
          if entry.start_time * 1000 ==  start_date
            if entry.end_time == nil
              if end_date == nil
                return true
              else
                return false
              end
            else entry.end_time * 1000 == end_date
              return true
            end
          end
          return false
        end

        def self.reconnect_references(patient, source_data_with_references, source_data_reference_id_hash, source_data_id_hash)

          source_data_with_references.each do |source_data_with_reference|
            #only do this with the references
            sdc = patient['source_data_criteria'][source_data_with_reference]
            source_data_reference_id_hash[sdc['criteria_id']].each do |ref_criteria_id|
              ref_sdc = patient['source_data_criteria'][source_data_id_hash[ref_criteria_id]]
              compare_and_update_entries(patient, ref_sdc['coded_entry_id'],ref_sdc['start_date'],ref_sdc['end_date'],ref_sdc['codes'])
            end
          end
        end

        def self.unpack_and_store_valuesets(zip, bundle)
          entries = zip.glob(SOURCE_ROOTS[:valuesets])
          entries.each_with_index do |entry, index|
            vs = HealthDataStandards::SVS::ValueSet.new(unpack_json(entry))
            vs['bundle_id'] = bundle.id
            HealthDataStandards::SVS::ValueSet.collection.insert(vs.as_document)
            report_progress('Value Sets', (index*100/entries.length)) if index%10 == 0
          end
          puts "\rLoading: Value Sets Complete          "
        end

        def self.unpack_and_store_results(zip, type, measure_ids, bundle)
          zip.glob(File.join(SOURCE_ROOTS[:results],'*.json')).each do |entry|
            name = Pathname.new(entry.name).basename('.json').to_s
            collection = (name == "by_patient") ? "patient_cache" : "query_cache"

            contents = unpack_json(entry)

            if (type)
              contents.select! {|entry| measure_ids.include? entry['measure_id']} if collection == 'query_cache'
              contents.select! {|entry| measure_ids.include? entry['value']['measure_id']} if collection == 'patient_cache'
            end

            contents.each do |document|
              if name == "by_patient"
                # Set the patient_id to the actual _id of
                # newly created patient record
                medical_record_id = document['value']['medical_record_id']
                if patient = Record.by_patient_id(medical_record_id).first
                  document['value']['patient_id'] = patient.id
                end
              end
              document['bundle_id'] = bundle.id
              Mongoid.default_session[collection].insert(document)
            end
          end
          puts "\rLoading: Results Complete          "
        end

        def self.unpack_json(entry)
          JSON.parse(entry.get_input_stream.read,:max_nesting => 100)
        end

        def self.report_progress(label, percent)
          print "\rLoading: #{label} #{percent}% complete"
          STDOUT.flush
        end

      end
    end
  end
end
