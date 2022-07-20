# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Sidekiq to rails application
    # Sidekiq is a job server that can be used to process jobs in the background.
    class Sidekiq < AddOn
      def apply
        say 'Setting up sidekiq'
        directory('app/workers', 'app/workers')
      end
    end
  end
end
