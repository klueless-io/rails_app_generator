# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Docker Compose to rails application
    class DockerCompose < RailsAppGenerator::Addon
      # Requires Testing
      def apply
        template 'docker-compose.yml.erb', 'docker-compose.yml'
      end
    end
  end
end
