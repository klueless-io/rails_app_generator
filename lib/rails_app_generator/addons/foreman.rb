# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Foreman process management for applications with multiple components
    class Foreman < AddOn
      def apply
        template '.foreman.erb', '.foreman'
        template 'Procfile.erb', 'Procfile'
        template 'Procfile.dev.erb', 'Procfile.dev'
      end
    end
  end
end
