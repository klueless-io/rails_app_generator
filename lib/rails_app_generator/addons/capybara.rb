# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Capybara to rails application
    class Capybara < RailsAppGenerator::Addon
      required_gem gem.version('capybara', '3.37.1', 'Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website')

      def apply
        say 'Setting up Capybara'
        # template('capybara_template.rb', 'target/capybara.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/capybara.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_template
        say 'Setting up Capybara - before custom template'
      end

      def before_bundle
        say 'Setting up Capybara - before bundle install'
      end

      def after_bundle
        say 'Setting up Capybara - after bundle install'
      end
    end
  end
end
