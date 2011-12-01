require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Redisk::Stat do
  before(:each) do
    @stat = Redisk::Stat.new('test_stat')
  end
  
  after(:each) do
    keys = Redisk.redis.keys('test_stat:*')
    keys.each do |key|
      Redisk.redis.del key.gsub(/^redisk\:/, '')
    end
  end
  
  describe 'initialize' do
    
    it 'should return a Redisk::Stat object' do
      @stat.should be_instance_of(Redisk::Stat)
    end
    
    it 'should set name' do
      @stat.name.should == 'test_stat'
    end
    
    it 'should write defaults for new files' do
      @stat.size.should == 0
      @stat.atime.should be_instance_of(Time)
    end 
  end

  describe 'atime' do
    
    it 'should return a time' do
      @stat.atime.should be_instance_of(Time)
    end
    
    it 'should return the last access time' do
      inital_time = @stat.atime
      sleep 1  
      @stat = Redisk::Stat.new('test_stat')
      new_time = @stat.atime
      new_time.should > inital_time
    end
    
  end
  
  describe 'ctime' do
    
    it 'should return a time' do
      @stat.ctime.should be_instance_of(Time)
    end
    
    it 'should return the last changed time' do
      inital_time = @stat.ctime
      sleep 1
      @stat.write_attribute('size', 4000)
      new_time = @stat.ctime
      new_time.should > inital_time
    end
    
  end
  
  describe 'mtime' do
    
    it 'should return a time' do
      @stat.mtime.should be_instance_of(Time)
    end
    
    it 'should return the last modification of the io' do
      inital_time = @stat.mtime
      sleep 1
      @io = Redisk::IO.new('test_stat')
      @io.write '123'
      new_time = @stat.mtime
      new_time.should > inital_time
    end
  end
  
  describe 'size' do
    it 'should return the length of the IO in bytes' do
      @io = Redisk::IO.new('test_stat')
      @io.write '123'
      @stat.size.should == 3
    end  
  end

end