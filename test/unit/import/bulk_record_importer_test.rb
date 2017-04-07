require 'test_helper'

class BulkRecordImporterTest < Minitest::Test

  def setup
    Record.all.delete
  end

  def test_bulk_record_import_xml_archive
    file = File.new('test/fixtures/bulk_importer/bulk_import_sample.zip')
    HealthDataStandards::Import::BulkRecordImporter.import_archive(file,"./tmp/failed")
    patient1 = Record.where({"first" => "Cancer_Adult_Female"}).first
    patient2 = Record.where({"first" => "Cancer_Adult_Male"}).first
    assert_equal patient1["encounters"].count, 2, "Patient1 should have 2 encounters"
    assert_equal patient2["encounters"].count, 2, "Patient2 should have 2 encounters"
  end


  def test_bulk_record_import_xml_directory
    file = Dir.new('test/fixtures/bulk_importer/bulk_import_sample')
    HealthDataStandards::Import::BulkRecordImporter.import_directory(file,"./tmp/failed")
    patient1 = Record.where({"first" => "Cancer_Adult_Female"}).first
    patient2 = Record.where({"first" => "Cancer_Adult_Male"}).first
    assert_equal patient1["encounters"].count, 2, "Patient1 should have 2 encounters"
    assert_equal patient2["encounters"].count, 2, "Patient2 should have 2 encounters"
  end

  def test_bulk_record_import_json_directory
    file = Dir.new('test/fixtures/bulk_importer/json')
    HealthDataStandards::Import::BulkRecordImporter.import_directory(file,"./tmp/failed")
    patient1 = Record.where({"first" => "Cancer_Adult_Female"}).first
    patient2 = Record.where({"first" => "Cancer_Adult_Male"}).first
    assert_equal patient1["encounters"].count, 2, "Patient1 should have 2 encounters"
    assert_equal patient2["encounters"].count, 2, "Patient2 should have 2 encounters"
  end

 def test_bulk_record_import_json_archive
    file = File.new('test/fixtures/bulk_importer/bulk_import_sample_json.zip')
    HealthDataStandards::Import::BulkRecordImporter.import_archive(file,"./tmp/failed")
    patient1 = Record.where({"first" => "Cancer_Adult_Female"}).first
    patient2 = Record.where({"first" => "Cancer_Adult_Male"}).first
    assert_equal patient1["encounters"].count, 2, "Patient1 should have 2 encounters"
    assert_equal patient2["encounters"].count, 2, "Patient2 should have 2 encounters"
  end

  def test_bulk_record_import_bad_archive
    file = File.new('test/fixtures/bulk_importer/random.zip')
    err=nil
    begin
      HealthDataStandards::Import::BulkRecordImporter.import_archive(file,"./tmp/failed")
    rescue
      err = $!
    end
    assert !err.nil?
    assert_equal 0, Record.count

  end

end
