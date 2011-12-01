source "http://rubygems.org"

gemspec :development_group => :test

gem 'bson_ext', :platforms => :mri
gem 'rake'

group :test do
  gem 'cover_me', '>= 1.0.0.rc5', :platforms => :ruby_19
  gem 'metric_fu'
  gem 'sinatra'
end

group :build do
  gem 'yard'
  gem 'kramdown' # needed by yard
end
