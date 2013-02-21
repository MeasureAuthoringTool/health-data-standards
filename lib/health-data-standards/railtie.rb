module HealthDataStandards
  class Railtie < Rails::Railtie
    initializer 'Rails logger' do
      HealthDataStandards.logger = Rails.logger
    end
    puts "Railtie"
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end

  end
end