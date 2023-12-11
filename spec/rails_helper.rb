# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'factory_bot_rails'
require 'vcr'

FactoryBot.definition_file_paths = [File.expand_path('../factories', __dir__)]
FactoryBot.find_definitions

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

    if !driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  FactoryBot.reload # This should be here to reload factories once

  config.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].downcase.gsub(/\s+/, '_').gsub(/[^a-z0-9_]/, '')
    VCR.use_cassette(name) { example.run }
  end
end
