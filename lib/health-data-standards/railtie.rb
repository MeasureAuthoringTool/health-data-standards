module HealthDataStandards
  class Railtie < Rails::Railtie
    initializer 'Rails logger' do
      HealthDataStandards.logger = Rails.logger
    end
  end
end