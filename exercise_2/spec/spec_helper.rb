require 'simplecov'
SimpleCov.start
require 'bundler'
Bundler.require :default, :test

Dir.glob("./app/**/*.rb").each { |f| require f }
