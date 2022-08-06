# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Hexapdf to rails application
    class Hexapdf < AddOn
      required_gem gem.version('hexapdf', '0.24.0', 'HexaPDF is a pure Ruby library with an accompanying application for working with PDF files.')

      def apply
        say 'Setting up Hexapdf'
        # template('hexapdf_template.rb', 'target/hexapdf.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/hexapdf.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_bundle
        say 'Setting up Hexapdf - before bundle install'
      end

      def after_bundle
        say 'Setting up Hexapdf - after bundle install'
      end
    end
  end
end
