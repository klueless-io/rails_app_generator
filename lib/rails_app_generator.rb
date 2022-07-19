# frozen_string_literal: true

# require 'k_log'

require 'rails/command/base'
require 'rails/generators/app_base'
require 'rails/generators'
require 'rails/generators/app_name'
require 'rails/generators/rails/app/app_generator'
require 'bundler'

require 'rails_app_generator/version'
require 'rails_app_generator/options/map_option_pass_through'
require 'rails_app_generator/options/map_option_boolean_flag'
require 'rails_app_generator/options/build_option'
require 'rails_app_generator/options/build_options'
require 'rails_app_generator/starter'
require 'rails_app_generator/app_builder'
require 'rails_app_generator/app_generator'

# require "rails_app_generator/generators/base"
# require "rails_app_generator/generators/foo_generator"
# require "rails_app_generator/generators/advisories_generator"

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
