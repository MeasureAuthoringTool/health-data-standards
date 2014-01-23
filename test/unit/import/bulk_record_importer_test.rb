require 'test_helper'

class BulkRecordImporterTest < MiniTest::Unit::TestCase

  def test_bulk_record_import
    file = File.new('test/fixtures/bulk_import_sample.zip')
    HealthDataStandards::Import::BulkRecordImporter.import_archive(file)
    patient1 = Record.where({"first" => "Cancer_Adult_Female"}).first
    patient2 = Record.where({"first" => "Cancer_Adult_Male"}).first
    assert_equal patient1["encounters"].count, 2, "Patient1 should have 2 encounters"
    assert_equal patient2["encounters"].count, 2, "Patient2 should have 2 encounters"
  end

end