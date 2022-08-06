# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rubocop to rails application
    class Rubocop < Addon
      def apply
        template '.rubocop.yml.erb', '.rubocop.yml'
      end
    end
  end
end
