require 'test_helper'


class ImporterTest< MiniTest::Unit::TestCase
  
  def setup
    @db = Mongoid.default_session
    @bundle_root = File.join("test","fixtures","bundles")
    @b_2_0_1 = File.join(@bundle_root,"bundle_version_2.0.1.zip")
    @b_2_0_2 = File.join(@bundle_root,"bundle_version_2.0.2.zip")
    @b_no_version = File.join(@bundle_root,"bundle_no_version.zip")
  	dump_database
  end

  def assert_clean_db
  	["records","measures","bundles","patient_cache","query_cache"].each do |collection|
  		assert_equal @db[collection].where({}).count , 0, "Should be 0 #{collection} in the db"
  	end
  	
  end

 def test_no_version
  assert_clean_db
  loader = HealthDataStandards::Import::Bundle::Importer
  begin
    bundle = loader.import(File.new(@b_no_version), {delete_existing: false})
    assert false, "Should have thrown exception for bundle with no version info"
  rescue
  end

 end

  def test_load_same_version_no_delete
    assert_clean_db
    loader = HealthDataStandards::Import::Bundle::Importer
    begin
      bundle = loader.import(File.new(@b_2_0_1), {delete_existing: false})
      bundle = loader.import(File.new(@b_2_0_1), {delete_existing: false})
      assert false, "Should have thrown exception attempting to version of bundle already loaded"
    rescue
    end
  end



  def test_load_same_version_with_delete
    assert_clean_db
    loader = HealthDataStandards::Import::Bundle::Importer
    begin
      bundle = loader.import(File.new(@b_2_0_1), {delete_existing: true})
      m_count = HealthDataStandards::CQM::Measure.count
      r_count = Record.count

      bundle = loader.import(File.new(@b_2_0_1), {delete_existing: true})
      assert_equal 1, HealthDataStandards::CQM::Bundle.count, "Should only be 1 bundle in the db "

      assert_equal m_count, bundle.measures.count, "Only the measures loaded in the last bundle should be available"
      assert_equal r_count, bundle.records.count, "Only the records loaded in the last bundle should be available"
    rescue
      puts $!
       assert false, "Should not have errored attempting to load db with same version of bundle with delete existing"
    end
  end

  def test_load_with_update
    assert_clean_db
    loader = HealthDataStandards::Import::Bundle::Importer
    bundle = loader.import(File.new(@b_2_0_1), {delete_existing: false})
    measure = bundle.measures.where({:nqf_id => "0002"}).first
    assert measure["name"] != "Name: 0002", "Measure name should not be Name: 0002"
    bundle2 = loader.import(File.new(@b_2_0_2), {update_measures: true})
    measure = bundle.measures.where({:nqf_id => "0002"}).first
    measure.reload
    assert_equal "Name: 0002", measure["name"] , "Measure name should be Name: 0002"
  end


  def test_load_without_update

    assert_clean_db
    loader = HealthDataStandards::Import::Bundle::Importer
    bundle = loader.import(File.new(@b_2_0_1), {delete_existing: false})
    measure = bundle.measures.where({:nqf_id => "0002"}).first
    name = measure["name"]
    assert measure["name"] != "Name: 0002", "Measure name should not be Name: 0002"
    bundle2 = loader.import(File.new(@b_2_0_2), {update_measures: false})
    measure = bundle.measures.where({:nqf_id => "0002"}).first
    measure.reload
    assert_equal  name , measure["name"] , "Measure name #{name} should equal #{measure.name} and should not have been updated"
  end



  def test_load
  	assert_clean_db
  	loader = HealthDataStandards::Import::Bundle::Importer
  	bundle = loader.import(File.new(@b_2_0_1), {delete_existing: false})
  	assert_equal  1,  HealthDataStandards::CQM::Bundle.count , "Should be 1 bundle in the db"
  	assert_equal  2,  HealthDataStandards::CQM::Measure.count ,  "Should be 12 measure in the db"
    assert_equal   HealthDataStandards::CQM::Measure.count, bundle.measures.count, "Number of measures total measures should equal number of measures in the db"
  	assert_equal  57 ,Record.count , "Should be 0 records in the db"
  	assert_equal  4780, @db["patient_cache"].where({}).count , "Should be 0 entries in the patient_cache "
  	#assert_equal  0, @db["query_cache"].where({}).count ,"Should be 0 entries in the query_cache "



  	bundle2 = loader.import(File.new(@b_2_0_2),{delete_existing: false})
  	assert_equal 2 , HealthDataStandards::CQM::Bundle.count ,  "Should be 2 bundle in the db"
  	assert_equal 5,  HealthDataStandards::CQM::Measure.count , "Should be 4 measure in the db"
  	assert_equal 114, Record.count ,  "Should be 114 records in the db"
  	assert_equal  4780*2 , @db["patient_cache"].where({}).count , "Should be 0 entries in the patient_cache "
  	assert  @db["query_cache"].where({}).count > 0 ,"Should be 0 more than  entries in the query_cache "

  
  	measure_0002 = HealthDataStandards::CQM::Measure.where({"nqf_id" => "0002"})
    assert_equal 2, measure_0002.count, "There should be 2 instances of measure 0002 in the db. One for each bundle"
  	measure_0003 =  HealthDataStandards::CQM::Measure.where({"nqf_id" => "0003"})
  	assert_equal 2,measure_0003.count ,  "There should only be 2 measure 0003 in the db"
    measure_0004 =  HealthDataStandards::CQM::Measure.where({"nqf_id" => "0004"})
    assert_equal 1,measure_0004.count ,  "There should only be 1 measure 0004 in the db"
    assert_equal bundle2.id, measure_0004.first["bundle_id"], "Measure 0003 bundle should equal the bundle it was loaded from"
  	



    
  end




end