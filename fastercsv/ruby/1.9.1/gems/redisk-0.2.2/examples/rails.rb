# You could put this in a Rails environment

# Set the logger to log to redis and truncate it at 10,000 lines
config.logger = Redisk::Logger.new("#{Rails.env}.log", :truncate => 10 * 1000)
