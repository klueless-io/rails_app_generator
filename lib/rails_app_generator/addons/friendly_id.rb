# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add FriendlyId to rails application
    class FriendlyId < RailsAppGenerator::Addon
      required_gem gem.version('friendly_id', '5.4.2', '')

      def apply
        generate('friendly_id')
      end
    end
  end
end
