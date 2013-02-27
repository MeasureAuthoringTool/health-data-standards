module HealthDataStandards
	module Import
		module Bundle
			
			class Importer
			COLLECTION_NAMES = ["bundles", "records", "measures", "selected_measures", "patient_cache", "query_cache", "system.js"]
			DEFAULTS = {clear_db: false, 
									type: nil,
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
		    bundle_versions = Hash[* HealthDataStandards::CQM::Bundle.where({}).collect{|b| [b._id, b.version]}.flatten]
		    # Unpack content from the bundle.
		    bundle_contents = unpack_bundle_contents(zip, options[:type])
		    bundle =  HealthDataStandards::CQM::Bundle.new( JSON.parse(bundle_contents[:bundle]))
		    
		    if bundle_versions.invert[bundle.version]  && !(options[:delete_existing] || options[:clear_db])
		      raise "A bundle with version #{bundle.version} already exists in the database. "
		    end

		    drop_collections(COLLECTION_NAMES+(options[:clear_collections]||[])) if options[:clear_db]
		     HealthDataStandards::CQM::Bundle.where({:version => bundle.version}).each {|b| b.delete}
		    # Store all JS libraries.
		    bundle_contents[:extensions].each do |key, contents|
		      save_system_js_fn(key, contents)
		    end

		    # Store the bundle metadata.

		    
		    unless bundle.save
		    	raise bundle.errors.full_messages.join(",")
		    end

		    bundle_id = bundle.id
		    
		    
		    # Store all measures.
		    bundle_contents[:measures].each do |key, contents|
		      json = JSON.parse(contents, {:max_nesting => 100})
		      measure = json.clone
		      # measure =  HealthDataStandards::CQM::Measure.new(json)
		      measure['bundle_id'] = bundle_id
		      Mongoid.default_session["measures"].insert(measure)
	

		      if options[:update_measures]
		      	  Mongoid.default_session["measures"].where({hqmf_id: measure["hqmf_id"], sub_id: measure["sub_id"]}).each do |m|
		      		b = HealthDataStandards::CQM::Bundle.find(m["bundle_id"])
		      		if b.version < bundle.version
		      			m.merge!(json)
		      			Mongoid.default_session["measures"].where({"_id" => m["_id"]}).update(m)
		      		end

		      	end
		      end
		    end
		    
		 
		    bundle_contents[:patients].each do |key, contents|
		      patient = Record.new( JSON.parse(contents, {:max_nesting => 100}))
		      patient['bundle_id'] = bundle_id
		      patient.save
		    end

		    bundle_contents[:valuesets].each do |key, contents|
		      json = JSON.parse(contents, {:max_nesting => 100})
		      vs = HealthDataStandards::SVS::ValueSet.new(json)
		      vs['bundle_id'] = bundle_id
		      vs.save
		    end
		    
		    # Store the expected results into the query and patient caches.
		    bundle_contents[:results].each do |name, contents|
		      collection = name == "by_patient" ? "patient_cache" : "query_cache"
		      contents = JSON.parse(contents, {:max_nesting => 100})

		      contents.each {|document| 
		        document['bundle_id'] = bundle_id
		        Mongoid.default_session[collection].insert(document)
		      }

		    end
		    
		    bundle
		  end

		# Delete a list of collections. By default, this function drops all of collections related to measures and patients.
    #
    # @param [Array] collection_names Optionally, an array of collection names to be dropped.
    def self.drop_collections(collection_names=[])
      collection_names = COLLECTION_NAMES if collection_names.empty?
      collection_names.each {|collection| Mongoid.default_session[collection].drop}
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

		def self.unpack_bundle_contents(zip, type = nil)
		  bundle_contents = { bundle: nil, measures: {}, patients: {}, extensions: {}, results: {}, valuesets: {} }
		  Zip::ZipFile.open(zip.path) do |zipfile|
		    zipfile.entries.each do |entry|
		      bundle_contents[:bundle] = zipfile.read(entry.name) if entry.name.include? "bundle"
		      if type.nil? || entry.name.match(Regexp.new("/#{type}/")) 
		        bundle_contents[:measures][entry_key(entry.name, "json")] = zipfile.read(entry.name) if entry.name.match /^measures.*\.json$/
		        bundle_contents[:patients][entry_key(entry.name, "json")] = zipfile.read(entry.name) if entry.name.match /^patients.*\.json$/ # Only need to import one of the formats
		        bundle_contents[:results][entry_key(entry.name,"json")] = zipfile.read(entry.name) if entry.name.match /^results.*\.json/
		      end
		      bundle_contents[:extensions][entry_key(entry.name,"js")] = zipfile.read(entry.name) if entry.name.match /^library_functions.*\.js/

		      bundle_contents[:valuesets][entry_key(entry.name,"json")] = zipfile.read(entry.name) if entry.name.match /^value_sets.*\.json/
		    end
		  end
		  bundle_contents
			end
		end

		end
	end
end
