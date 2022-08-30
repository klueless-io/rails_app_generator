# frozen_string_literal: true

# lib/rails_app_generator/rag_initializer.rb
# add_if(:scenic)
# rag.add_option :add_scenic            , type: :boolean, default: false

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Scenic to rails application
    class Scenic < RailsAppGenerator::Addon
      required_gem gem.version('scenic', '1.6.0', '')

      def apply
        say 'Setting up Scenic'
        # template('scenic_template.rb', 'target/scenic.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/scenic.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_template
        say 'Setting up Scenic - before custom template'
      end

      def before_bundle
        say 'Setting up Scenic - before bundle install'
      end

      def after_bundle
        say 'Setting up Scenic - after bundle install'
      end
    end
  end
end
