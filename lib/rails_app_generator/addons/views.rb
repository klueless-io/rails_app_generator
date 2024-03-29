# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add default rails views
    class Views < RailsAppGenerator::Addon
      depends_on :tailwind

      def apply
        say 'Setting up custom landing page'
        directory 'app/views/layouts', 'app/views/layouts', force: true
        directory 'app/views/shared', 'app/views/shared'
        directory 'app/views/pages', 'app/views/pages' if uses?(:high_voltage)
        # Make sure we can access any images put into the images folder
        inject_into_file('app/javascript/packs/application.js', "require.context('../images', true)")
        directory 'app/javascript/images', 'app/javascript/images'
      end
    end
  end
end
