PADRINO_ENV = :test unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.mock_with :rr
  conf.include Rack::Test::Methods
  # conf.include RSpec::Padrino
end

def app
  Padrino.application
end
