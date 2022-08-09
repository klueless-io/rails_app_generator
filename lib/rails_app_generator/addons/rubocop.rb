# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rubocop to rails application
    class Rubocop < RailsAppGenerator::Addon
      # required_gem gem.version('rubocop', '1.34.0', 'RuboCop is a Ruby code style checking and code formatting tool.')
      # TODO: This needs to go into the development group
      required_gem gem.version('rubocop-rails', '2.15.2', 'NOTE: MOVE TO DEVELOPMENT GROUP: RuboCop linter with focused on enforcing Rails best practices and coding conventions.')

      def apply
        template '.rubocop.yml.erb', '.rubocop.yml'
      end
    end
  end
end
