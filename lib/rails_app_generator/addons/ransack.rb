# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Ransack to rails application
    class Ransack < RailsAppGenerator::Addon
      required_gem gem.version('ransack', '3.2.1', 'Object-based searching.')

      def apply
        say 'Setting up Ransack'
        # template('ransack_template.rb', 'target/ransack.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/ransack.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_template
        say 'Setting up Ransack - before custom template'
      end

      def before_bundle
        say 'Setting up Ransack - before bundle install'
      end

      def after_bundle
        say 'Setting up Ransack - after bundle install'
      end
    end
  end
end
