ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :helper

  Capybara.javascript_driver = :poltergeist

  config.before(:example) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:example, type: :feature) do
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

    if !driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :deletion
    end
  end

  config.before(:example) do
    DatabaseCleaner.start
  end

  config.append_after(:example) do
    DatabaseCleaner.clean
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.use_transactional_fixtures = false

  config.backtrace_exclusion_patterns << /gems/

  config.infer_spec_type_from_file_location!
end
