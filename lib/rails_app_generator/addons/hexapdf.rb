# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Hexapdf to rails application
    class Hexapdf < AddOn
      required_gem gem.version('hexapdf', '0.24.0', 'HexaPDF is a pure Ruby library with an accompanying application for working with PDF files.')

      def apply
      end
    end
  end
end
