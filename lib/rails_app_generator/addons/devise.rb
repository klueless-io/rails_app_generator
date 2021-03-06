# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Devise authentication to rails application
    class Devise < AddOn
      depends_on :active_record

      required_gem gem.version('devise', '4.8.1', 'Flexible authentication solution for Rails with Warden')

      def apply
        generate('devise:install', capture: true)
        generate(:devise, 'User', 'name', 'admin:boolean', capture: true)

        directory('app/views/devise', 'app/views/devise') if uses?(:views)

        generate('devise:controllers', 'users', capture: true)

        update_development_rb
        gsub_file 'config/initializers/devise.rb', /# config.pepper = .+/, "  # config.pepper = 'pepper'"
        gsub_file 'config/initializers/devise.rb', /# config.secret_key = .+/, "  # config.secret_key = 'secret_key'"
        db_changes
        create_seed
      end

      private

      def update_development_rb
        inject_into_file 'config/environments/development.rb', before: /^end/ do
          <<-RUBY

  # Enable devise mailer
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
          RUBY
        end
      end

      def db_changes
        in_root do
          migration = Dir.glob('db/migrate/*').max_by { |f| File.mtime(f) }
          gsub_file migration, /:admin/, ':admin, default: false'
        end
      end

      def create_seed
        insert_into_file 'db/seeds.rb' do
          <<~RUBY
            # Create an initial admin user for development
            User.find_or_create_by(email: "admin@admin.com") do |user|
              user.name = 'Admin'
              user.password = 'password'
              user.admin = true
            end
          RUBY
        end
      end
    end
  end
end
