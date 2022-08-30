# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Scenic to rails application
    class Scenic < RailsAppGenerator::Addon
      required_gem gem.version('scenic', '1.6.0', 'Ads methods to ActiveRecord:Migration to create and manage database views in Rails')

      def apply
        bundle_install
      end
    end
  end
end
