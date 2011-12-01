module QME
  module DatabaseAccess
    
    # Set up the information to connect to the database. Database host
    # and port may be set using the environment variables TEST_DB_HOST
    # and TEST_DB_PORT which default to localhost and 27017 respectively.
    # @param [String] db_name the name of the database to use
    def determine_connection_information(db_name = nil)
      @db_name = ENV['DB_NAME'] || db_name || 'test'
      @db_host = ENV['TEST_DB_HOST'] || 'localhost'
      @db_port = ENV['TEST_DB_PORT'] ? ENV['TEST_DB_PORT'].to_i : 27017
    end
    
    # Directly inject an instance of a database
    # @param [Mongo::Database] db the database that you would like the object to use
    def inject_db(db)
      @db = db
    end

    # Lazily creates a connection to the database and initializes the
    # JavaScript environment
    # @return [Mongo::Connection]
    def get_db
      if @db == nil
        @db = Mongo::Connection.new(@db_host, @db_port).db(@db_name)
      end
      @db
    end
  end
end