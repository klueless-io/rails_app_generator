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
        generate(:devise, 'User', 'name', 'role:integer', capture: true)

        update_migration

        add_trackable       if option?(:devise_has_trackable)
        add_confirmable     if option?(:devise_has_confirmable)
        add_lockable        if option?(:devise_has_lockable)

        add_turbo_support

        generate('devise:views', capture: true)
        generate('devise:controllers', 'users', capture: true)

        update_routes_with_devise_controllers

        copy_file('app/controllers/users/registrations_controller.rb', 'app/controllers/users/registrations_controller.rb', force: true)

        enable_devise_mailer

        directory('app/views', force: true)
      end

      def before_bundle
        prepend_to_file 'db/seeds.rb', seed, force: true
      end

      private

      def update_migration
        in_root do
          migration = Dir.glob('db/migrate/*').max_by { |f| File.mtime(f) }
          gsub_file migration, /:role/, ':role, default: 0'
        end
      end

      def enable_devise_mailer
        inject_into_file 'config/environments/development.rb', <<-RUBY, after: %(config.action_mailer.raise_delivery_errors = false)

  # Enable devise mailer
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
        RUBY
      end

      def update_routes_with_devise_controllers
        in_root do
          controller_config = [
            'sessions: "users/sessions"',
            'registrations: "users/registrations"'
          ]
          controller_config << 'masquerades: "users/masquerades"' if active?(:devise_masquerade)

          devise_for_replacement = "devise_for :users, controllers: { #{controller_config.join(', ')} }"

          gsub_file 'config/routes.rb', /devise_for :users/, devise_for_replacement
        end
      end

      def add_trackable
        # TODO: remove these comments in generated file

        ## Trackable
        # t.integer  :sign_in_count, default: 0, null: false
        # t.datetime :current_sign_in_at
        # t.datetime :last_sign_in_at
        # t.string   :current_sign_in_ip
        # t.string   :last_sign_in_ip
      end

      def add_confirmable
        # TODO: remove these comments in generated file

        ## Confirmable
        # t.string   :confirmation_token
        # t.datetime :confirmed_at
        # t.datetime :confirmation_sent_at
        # t.string   :unconfirmed_email # Only if using reconfirmable
      end

      def add_lockable
        # TODO: remove these comments in generated file

        ## Lockable
        # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
        # t.string   :unlock_token # Only if unlock strategy is :email or :both
        # t.datetime :locked_at
      end

      def add_turbo_support
        copy_file('app/controllers/turbo_devise_controller.rb', 'app/controllers/turbo_devise_controller.rb')
        copy_file('config/initializers/devise_turbo.rb', 'config/initializers/devise_turbo.rb')
      end

      def seed
        <<~RUBY
          # Create an initial admin user for development
          User.find_or_create_by(email: "admin@admin.com") do |user|
            user.name = 'Admin'
            user.password = 'password'
            user.role = :admin
          end

        RUBY
      end
    end
  end
end
