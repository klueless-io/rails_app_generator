# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Brakeman to rails application
    class Brakeman < RailsAppGenerator::Addon
      required_gem gem.version('brakeman', '5.3.1', 'Brakeman is a static analysis security vulnerability scanner for Ruby on Rails applications')

      def apply; end
    end
  end
end
