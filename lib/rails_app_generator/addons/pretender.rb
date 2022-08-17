# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Pretender to rails application
    class Pretender < RailsAppGenerator::Addon
      required_gem gem.version('pretender', '0.4.0', 'Log in as another user in Rails')

      def apply; end
    end
  end
end
