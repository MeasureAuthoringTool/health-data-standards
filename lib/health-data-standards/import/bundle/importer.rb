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
            unpack_and_store_patients(zip_file, options[:type], bundle)
            unpack_and_store_valuesets(zip_file, bundle)
            unpack_and_store_results(zip_file, options[:type], measure_ids, bundle)

          end

          bundle
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
              "value" => Moped::BSON::Code.new(fn)
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
            patient.save
            report_progress('patients', (index*100/entries.length)) if index%10 == 0
          end
          puts "\rLoading: Patients Complete          "
        end

        def self.unpack_and_store_valuesets(zip, bundle)
          entries = zip.glob(SOURCE_ROOTS[:valuesets])
          bulk = []
          entries.each_with_index do |entry, index|
            vs = HealthDataStandards::SVS::ValueSet.new(unpack_json(entry))
            vs['bundle_id'] = bundle.id
            bulk << vs
            report_progress('Value Sets', (index*100/entries.length)) if index%10 == 0
          end
          HealthDataStandards::SVS::ValueSet.collection.insert(bulk.map {|vs| vs.as_document})
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
