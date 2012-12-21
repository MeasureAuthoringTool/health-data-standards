module QrdaGenerator
  class Railtie < Rails::Railtie
    initializer 'Rails logger' do
      QrdaGenerator.logger = Rails.logger
    end
  end
end