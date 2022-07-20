# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Docker to rails application
    class Docker < AddOn
      def apply
        template 'Dockerfile.erb', 'Dockerfile'
        template '.dockerignore.erb', '.dockerignore'
      end
    end
  end
end
