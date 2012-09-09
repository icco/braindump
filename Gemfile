source :rubygems

# Server requirements
gem 'thin'

# Component requirements
gem 'less'
gem 'activerecord', :require => 'active_record'

# Database
group :production do
  gem 'pg'
end

# Project requirements
gem 'erubis'
gem 'gravatar-ultimate' # https://github.com/sinisterchipmunk/gravatar
gem 'json'
gem 'less'
gem 'multi_json'
gem 'rack-less', :git => 'git://github.com/kellyredding/rack-less.git'
gem 'rake'
gem 'rdiscount'
gem 'sequel'
gem 'sinatra'
gem 'sinatra-flash', :require => 'sinatra/flash'
gem 'therubyracer' # Not sure why this isn't a dep for Less...

# Padrino Stable Gem
gem 'padrino', '>= 0.10.7'

# For dev
group :development do
  gem 'heroku'
  gem 'shotgun'
end

# Test requirements
group :test do
  gem 'rack-test', :require => "rack/test"
  gem 'rr'
  gem 'rspec'
end
