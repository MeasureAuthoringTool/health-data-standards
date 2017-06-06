source "https://rubygems.org"

gemspec :development_group => :test

group :development do
  gem 'rake'
  gem 'byebug', '~> 9.0.6',  platforms: [:ruby_20, :ruby_21, :ruby_22]
end

group :test do
  gem 'factory_girl', '~> 4.8.0'
  gem "tailor", '~> 1.4.1'
  gem "cane", '~> 3.0.0'
  gem 'simplecov', :require => false
  gem 'webmock'

  gem "minitest", "~> 5.10.2"
  gem 'minitest-reporters'
  gem 'awesome_print', :require => 'ap'

  gem 'simplexml_parser', :git => 'https://github.com/projecttacoma/simplexml_parser.git', :branch => 'master'

end
