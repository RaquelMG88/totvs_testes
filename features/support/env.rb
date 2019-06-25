require 'rspec'
require 'capybara/cucumber'
require 'pry'
require 'yaml'
require 'webdrivers'


Capybara.configure do |config|
  config.default_driver = :selenium_chrome
end
