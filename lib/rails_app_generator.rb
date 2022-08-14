# frozen_string_literal: true

require 'rails/command/base'
require 'rails/generators/app_base'
require 'rails/generators'
require 'rails/generators/app_name'
require 'rails/generators/rails/app/app_generator'
require 'bundler'
require 'k_config'

require 'rails_app_generator/version'
require 'rails_app_generator/util'
require 'rails_app_generator/configuration/rag_configuration'
require 'rails_app_generator/configuration/rag_configuration_extension'
require 'rails_app_generator/cli/diff'
require 'rails_app_generator/cli/profile'
require 'rails_app_generator/diff/file_pair'
require 'rails_app_generator/diff/compare_info'
require 'rails_app_generator/diff/processor'
require 'rails_app_generator/diff/report'
require 'rails_app_generator/diff/open_in_editor'
require 'rails_app_generator/options/base_map_option'
require 'rails_app_generator/options/map_option_ignore'
require 'rails_app_generator/options/map_option_string'
require 'rails_app_generator/options/map_option_boolean_flag'
require 'rails_app_generator/options/build_option'
require 'rails_app_generator/options/options_builder'
require 'rails_app_generator/options/rails_options'
require 'rails_app_generator/context'
require 'rails_app_generator/dependencies'
require 'rails_app_generator/gem_query'
require 'rails_app_generator/addon'
require 'rails_app_generator/addon_util'
require 'rails_app_generator/formatted_gem_entry'
require 'rails_app_generator/app_builder'
require 'rails_app_generator/app_generator'
require 'rails_app_generator/starter'

Dir[File.join(__dir__, 'rails_app_generator', 'addons', '*.rb')].sort.each { |file| require file }

module RailsAppGenerator
  # raise RailsAppGenerator::Error, 'Sample message'
  Error = Class.new(StandardError)
end

if ENV.fetch('KLUE_DEBUG', 'false').downcase == 'true'
  namespace = 'RailsAppGenerator::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('rails_app_generator/version') }
  version   = RailsAppGenerator::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
