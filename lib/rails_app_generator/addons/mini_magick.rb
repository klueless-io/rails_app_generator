# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add MiniMagick to rails application
    class MiniMagick < AddOn
      required_gem gem.version('mini_magick', '4.11.0', 'Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick')

      def apply
        say 'Setting up MiniMagick'
        # template('mini_magick_template.rb', 'target/mini_magick.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/mini_magick.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end

      def before_bundle
        say 'Setting up MiniMagick - before bundle install'
      end

      def after_bundle
        say 'Setting up MiniMagick - after bundle install'
      end
    end
  end
end
