# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rails Generator configuration to rails application
    class Generators < RailsAppGenerator::Addon

      # Requires Testing (NOT SURE IF THIS IS A GOOD APPROACH, need to look at other generator systems)
      def apply
        directory('lib/generators/rails/navigation', 'lib/generators/rails/navigation') if uses?(:views)

        template = 'lib/generators/rails/scaffold_controller_generator.rb'
        template(template) if uses?(:scaffold)

        generators = <<-RUBY
    config.generators do |generate|
        #{"require_relative '../lib/generators/rails/scaffold_controller_generator'" if uses?(:scaffold)}
        generate.helper false
        generate.javascripts false
        generate.request_specs false
        generate.routing_specs false
        generate.stylesheets false
        #{'generate.test_framework :rspec' if uses?(:rspec)}
        generate.view_specs false
        #{'generate.factory_bot true' if uses?(:factory_bot)}
    end
        RUBY
        inject_into_file 'config/application.rb', generators, before: /^ {2}end\n/
      end
    end
  end
end
