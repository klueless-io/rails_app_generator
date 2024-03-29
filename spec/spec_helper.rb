# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'

SimpleCov.start

require 'rails_app_generator'
require 'rails_app_generator/rag_initializer'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSPEC_ROOT = File.dirname __FILE__

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.filter_run_when_matching :focus

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
