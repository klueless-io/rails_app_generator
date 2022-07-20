# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Pundit - Pundit provides a set of helpers which guide you in
    # leveraging regular Ruby classes and object oriented design patterns
    # to build a simple, robust and scalable authorization system.
    class Pundit < AddOn
      def apply
        directory 'app/policies', 'app/policies'
        template 'app/controllers/authorized_controller.rb.erb', 'app/controllers/authorized_controller.rb'
      end
    end
  end
end
