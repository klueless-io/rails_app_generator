# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Sidekiq to rails application
    #
    # Sidekiq is a job server that can be used to process jobs in the background.
    # `Sidekiq` is a subclass of `Addon` that adds a `apply` method that says "setup sidekiq" and
    # copies the `app/workers` directory from the `templates` directory to the `app` directory
    class Sidekiq < Addon
      def apply
        say 'setup sidekiq'
        directory('app/workers', 'app/workers')
      end
    end
  end
end
