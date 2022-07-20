# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Tailwind CSS support to rails application
    class Scaffold < AddOn
      depends_on :tailwind

      def apply
        directory 'lib/templates/erb/scaffold', 'lib/templates/erb/scaffold'
      end
    end
  end
end
