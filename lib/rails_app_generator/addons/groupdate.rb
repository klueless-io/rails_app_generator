# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Groupdate to rails application
    class Groupdate < AddOn
      required_gem gem.version('groupdate', '6.1.0', 'The simplest way to group temporal data')

      # NOTE: in the examples, the Groupdate gem is used in conjunction with Chartkick.
      def apply
        say 'Setting up Groupdate'
        # template('groupdate_template.rb', 'target/groupdate.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/groupdate.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_bundle
        say 'Setting up Groupdate - before bundle install'
      end

      def after_bundle
        say 'Setting up Groupdate - after bundle install'
      end
    end
  end
end
