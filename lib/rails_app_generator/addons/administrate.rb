# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Administrate to rails application
    class Administrate < RailsAppGenerator::Addon
      required_gem gem.version('administrate', '0.17.0', 'Administrate is inspired by Rails Admin and ActiveAdmin, but aims to provide a better developer/user experience.')

      def apply
        say 'Setting up Administrate'
        # template('administrate_template.rb', 'target/administrate.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/administrate.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_bundle
        say 'Setting up Administrate - before bundle install'
      end

      def after_bundle
        say 'Setting up Administrate - after bundle install'
      end
    end
  end
end
