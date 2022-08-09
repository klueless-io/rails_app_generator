# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add DotEnv to rails application
    class Dotenv < RailsAppGenerator::Addon
      required_gem gem.version('dotenv-rails', '2.8.1', 'Loads environment variables from `.env`.')

      def apply
        template '.env.development.erb', '.env.development'
      end
    end
  end
end
