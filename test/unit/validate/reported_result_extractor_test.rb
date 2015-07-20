require 'test_helper'
require 'fileutils'

class ReportedResultExtractorTest < ActiveSupport::TestCase
  include HealthDataStandards::Validate::ReportedResultExtractor

  test "Should return the correct reported result for a CV value" do
    doc = File.new('test/fixtures/qrda/cat3_cv_good.xml')
    id = "40280381-4C18-79DF-014C-291EF3F90654"
    ids = {"IPP" => "EAD808CB-A6FA-4824-A204-74F299839396", "MSRPOPL" => "7462E67A-5ECB-41D6-AE14-2E89BB55BBDE", "OBSERV" => "2D084067-703B-4072-9F43-D50F938F4F9C"}

    doc = Nokogiri::XML(doc)
    results = extract_results_by_ids(id, ids, doc)

    #make sure the OBSERV result (the actual CV value) equals the value from the XML
    assert_equal results["OBSERV"], 240.0

  end
end