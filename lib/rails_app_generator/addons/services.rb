# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add DotEnv to rails application
    class Services < RailsAppGenerator::Addon
      def apply
        directory 'app/services', 'app/services'
      end
    end
  end
end
