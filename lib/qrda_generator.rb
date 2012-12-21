require 'health-data-standards'
require 'hqmf-parser'
require 'ostruct'
require 'log4r'

require_relative 'qrda_generator/export/cat_1'
require_relative 'qrda_generator/export/entry_template_resolver'

module QrdaGenerator
  class << self
    attr_accessor :logger
  end
end

if defined?(Rails)
  require_relative 'qrda_generator/railtie' 
else
  QrdaGenerator.logger = Log4r::Logger.new("QRDA Generator")
  QrdaGenerator.logger.outputters = Log4r::Outputter.stdout
end