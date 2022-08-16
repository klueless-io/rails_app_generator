# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Devise authentication to rails application
    class DeviseXxxx < RailsAppGenerator::Addon
      depends_on :active_record

      required_gem gem.version('devise', '4.8.1', 'Flexible authentication solution for Rails with Warden')

      # Requires Testing
      def apply
        update_development_rb
        gsub_file 'config/initializers/devise.rb', /# config.pepper = .+/, "  # config.pepper = 'pepper'"
        gsub_file 'config/initializers/devise.rb', /# config.secret_key = .+/, "  # config.secret_key = 'secret_key'"
        db_changes
        create_seed
      end
    end
  end
end
