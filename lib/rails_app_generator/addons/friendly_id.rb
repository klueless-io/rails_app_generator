# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add FriendlyId to rails application
    class FriendlyId < RailsAppGenerator::Addon
      required_gem gem.version('friendly_id', '5.4.2', 'FriendlyId provides slugging and permalink support for Active Record.')

      def apply
        bundle_install
        generate('friendly_id')
      end
    end
  end
end
