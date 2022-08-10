# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Lograge to rails application
    class Lograge < RailsAppGenerator::Addon
      required_gem gem.version('lograge', '0.12.0', 'Tame Rails multi-line logging into a single line per request')

      def apply
        template 'config/initializers/lograge.rb'
      end
    end
  end
end
