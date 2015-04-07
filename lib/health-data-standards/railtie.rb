module HealthDataStandards
  class Railtie < Rails::Railtie
    initializer 'Rails logger' do
      HealthDataStandards.logger = Rails.logger
    end
    rake_tasks do
      require_relative "tasks"
    end

  end
end