# frozen_string_literal: true

require_relative 'rails_app_generator/version'

module RailsAppGenerator
  # raise RailsAppGenerator::Error, 'Sample message'
  Error = Class.new(StandardError)

  # Your code goes here...
end

if ENV.fetch('KLUE_DEBUG', 'false').downcase == 'true'
  namespace = 'RailsAppGenerator::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('rails_app_generator/version') }
  version   = RailsAppGenerator::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
