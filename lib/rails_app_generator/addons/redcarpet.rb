# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add RedCarpet to rails application
    class Redcarpet < RailsAppGenerator::Addon
      required_gem gem.version('redcarpet', '3.5.1', 'A fast, safe and extensible Markdown to (X)HTML parser')

      def apply; end
    end
  end
end
