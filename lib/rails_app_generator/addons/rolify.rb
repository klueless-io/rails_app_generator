# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rolify to rails application
    class Rolify < RailsAppGenerator::Addon
      required_gem gem.version('rolify', '6.0.0', 'Role management library with resource scoping')

      def apply
        # bundle_install
        generate('rolify', 'Role', 'User', capture: true)

        gsub_file 'config/initializers/rolify.rb', '# config.use_dynamic_shortcuts', 'config.use_dynamic_shortcuts'
      end
    end
  end
end
