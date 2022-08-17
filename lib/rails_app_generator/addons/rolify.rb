# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rolify to rails application
    class Rolify < RailsAppGenerator::Addon
      required_gem gem.version('rolify', '6.0.0', 'Role management library with resource scoping.')

      def apply
        # bundle_install
        generate('rolify', 'role', 'user')

        say 'Setting up Rolify'
        # template('rolify_template.rb', 'target/rolify.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/rolify.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_template
        say 'Setting up Rolify - before custom template'
      end

      def before_bundle
        say 'Setting up Rolify - before bundle install'
      end

      def after_bundle
        say 'Setting up Rolify - after bundle install'
      end
    end
  end
end
