# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add DotEnv to rails application
    class Dotenv < RailsAppGenerator::Addon
      def apply
        template '.env.development.erb', '.env.development'
      end
    end
  end
end
