# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Avo to rails application
    class Avo < RailsAppGenerator::Addon
      required_gem gem.version('avo', '2.12.0', 'Avo full-featured admin panel abstracts away the common parts of building apps, letting your engineers work on your apps essential components.')

      def apply
        # copy_file 'config/initializers/avo.rb'

        generate('avo:install')

        gsub_file 'config/routes.rb', %(mount Avo::Engine, at: Avo.configuration.root_path), <<-RUBY
        authenticate :user do
          mount Avo::Engine, at: Avo.configuration.root_path
        end
        RUBY
      end

      def before_template
        say 'Setting up Avo - before custom template'
      end

      def before_bundle
        say 'Setting up Avo - before bundle install'
      end

      def after_bundle
        say 'Setting up Avo - after bundle install'
      end
    end
  end
end
