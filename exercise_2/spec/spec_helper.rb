require 'rspec/its'
require 'simplecov'
SimpleCov.start

Dir.glob("./app/**/*.rb").each { |f| require f }
