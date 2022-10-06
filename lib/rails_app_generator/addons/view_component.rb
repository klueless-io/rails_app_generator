# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add ViewComponent to rails application
    class ViewComponent < RailsAppGenerator::Addon
      required_gem gem.version('view_component', '2.74.0', 'A framework for building reusable, testable & encapsulated view components in Ruby on Rails.')
    end
  end
end
