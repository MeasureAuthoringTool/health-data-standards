class Measure
	include Mongoid::Document
	index "bundle_id" => 1
end