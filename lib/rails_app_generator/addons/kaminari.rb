# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Kaminari to rails application
    class Kaminari < RailsAppGenerator::Addon
      required_gem gem.version('kaminari', '1.2.2', 'Easily add pagination to your Ruby web apps')

      def apply
        generate('kaminari:config')
      end
    end
  end
end
