# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Devise to rails application
    class Devise < RailsAppGenerator::Addon
      depends_on :active_record

      required_gem gem.version('devise', '4.8.1', 'Flexible authentication solution for Rails with Warden')

      def apply
        generate('devise:install', capture: true)
        generate('devise:views', capture: true)
        generate(:devise, 'User', 'name', 'admin:boolean', capture: true)

        has_confirmable if uses?(:confirmable)
        has_lockable if uses?(:devise_has_lockable)

        copy_file('app/views/layouts/_alerts.html.erb', 'app/views/layouts/_alerts.html.erb')

        enable_devise_mailer
      end

      def before_template
        say 'Setting up Devise - before custom template'
      end

      def before_bundle
        say 'Setting up Devise - before bundle install'
      end

      def after_bundle
        say 'Setting up Devise - after bundle install'
      end

      private

      def enable_devise_mailer
        inject_into_file 'config/environments/development.rb', <<-RUBY, after: %(config.action_mailer.raise_delivery_errors = false)

  # Enable devise mailer
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
        RUBY
      end

      def has_confirmable
        # TODO: remove these comments

        ## Confirmable
        # t.string   :confirmation_token
        # t.datetime :confirmed_at
        # t.datetime :confirmation_sent_at
        # t.string   :unconfirmed_email # Only if using reconfirmable
      end

      def has_lockable
        # TODO: remove these comments

        ## Lockable
        # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
        # t.string   :unlock_token # Only if unlock strategy is :email or :both
        # t.datetime :locked_at
      end
    end
  end
end
