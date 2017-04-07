source "https://rubygems.org"

gemspec :development_group => :test

group :development, :test do
  gem 'bundler-audit'
end

group :development do
  gem 'rake'
  gem 'byebug', '~> 6.0.2',  platforms: [:ruby_20, :ruby_21, :ruby_22]
end

group :test do
  gem 'factory_girl', '~> 4.1.0'
  gem "tailor", '~> 1.1.2'
  gem "cane", '~> 2.3.0'
  gem 'simplecov', :require => false
  gem 'webmock'

  gem "minitest", "~> 5.3"
  gem 'minitest-reporters'
  gem 'awesome_print', :require => 'ap'

  gem 'simplexml_parser', :git => 'https://github.com/projecttacoma/simplexml_parser.git', :branch => 'master'

end
