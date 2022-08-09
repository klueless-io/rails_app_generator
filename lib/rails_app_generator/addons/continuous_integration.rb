# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add GitHub Actions continuous integration
    class ContinuousIntegration < RailsAppGenerator::Addon
      # Requires Testing
      def apply
        say 'continuous integration - Setup GitHub Actions'
        template('github/workflows/build.yml.erb', '.github/workflows/build.yml')
      end
    end
  end
end
