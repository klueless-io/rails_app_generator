# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Avo to rails application
    class Avo < RailsAppGenerator::Addon
      required_gem gem.version('avo', '2.12.0', 'Avo abstracts away the common parts of building apps, letting your engineers work on your apps essential components. The result is a full-featured admin panel that works out of the box, ready to give to your end-users.')

      def apply
        # copy_file 'config/initializers/avo.rb'
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
