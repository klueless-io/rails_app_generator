# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Groupdate to rails application
    class Groupdate < RailsAppGenerator::Addon
      required_gem gem.version('groupdate', '6.1.0', 'The simplest way to group temporal data')

      # NOTE: in the examples, the Groupdate gem is used in conjunction with Chartkick.
      def apply; end
    end
  end
end
