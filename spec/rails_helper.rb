ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require 'capybara/poltergeist'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller

  Capybara.javascript_driver = :webkit
  Capybara.default_wait_time = 15

  # register phantomjs driver:
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {
      # debug: true,
      timeout: 60,
      js_errors: true,
      inspector: true,
    })
  end

  config.before(:example) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:example, type: :feature) do
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

    if !driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:example) do
    DatabaseCleaner.start
  end

  config.append_after(:example) do
    DatabaseCleaner.clean
  end

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
end
