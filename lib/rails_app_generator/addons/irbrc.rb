# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add IrbRc to rails application
    class Irbrc < RailsAppGenerator::AddOn
      def apply
        template '.irbrc.erb', '.irbrc'
      end
    end
  end
end
