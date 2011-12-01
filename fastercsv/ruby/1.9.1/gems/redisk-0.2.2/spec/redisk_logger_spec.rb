require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Redis::Logger do
  before(:each) do
    @io = Redisk::IO.new('test.log').truncate(0)
  end
  
  describe 'initializing' do
    before do
      @logger = Redisk::Logger.new('test.log')
    end
    
    it 'should initialize a logger' do
      @logger.logger.should be_instance_of(::Logger)
    end
    
    it 'should initialize an io' do
      @logger.io.should be_instance_of(Redisk::IO)
      @logger.io.name.should == 'test.log'
    end
    
    it 'should return a Redis::Logger' do
      @logger.should be_instance_of(Redisk::Logger)
    end
  end
  
  describe 'logging' do
    
    it 'should delegate logging methods to logger' do
      @logger = Redisk::Logger.new('test.log')
      @logger.info('info').should == true
      @logger.length.should == 1
    end
    
  end
  
  describe 'initializing with :truncate' do
    
    it 'should trim the log after _n lines' do
      @logger = Redisk::Logger.new('test.log', :truncate => 5)
      5.times do |n|
        @logger.info("#{n} time")
      end
      @logger.length.should == 5
      @logger.info("another time")
      @logger.length.should == 5
      @logger.info("and again")
      @logger.length.should == 5
    end
    
  end
  
end
