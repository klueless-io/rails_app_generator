# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add PhonyRails to rails application
    class PhonyRails < RailsAppGenerator::Addon
      required_gem gem.version('phony_rails', '0.15.0', 'This Gem adds useful methods to your Rails app to validate, display and save phone numbers.')

      def apply
      end
    end
  end
end
