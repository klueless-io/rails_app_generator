# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add FactoryBotRails to rails application
    class FactoryBotRails < RailsAppGenerator::Addon
      required_gem gem.version('factory_bot_rails', '6.2.0', 'Provides Rails integration for factory_bot')

      def apply
        say 'Setting up FactoryBotRails'
      end
    end
  end
end
