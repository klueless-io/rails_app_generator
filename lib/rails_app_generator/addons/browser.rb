# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Browser to rails application
    class Browser < Addon
      required_gem gem.version('browser', '5.3.1', 'Do some browser detection with Ruby.')

      def apply; end
    end
  end
end
