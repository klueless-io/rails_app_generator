# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add ActsAsList to rails application
    class ActsAsList < RailsAppGenerator::Addon
      depends_on :active_record
      required_gem gem.version('acts_as_list', '1.0.4', <<~COMMENT)
        This "acts_as" extension provides the capabilities for sorting and reordering a number of objects in a list.
        The class that has this specified needs to have a "position" column defined as an integer on the mapped database table.
      COMMENT

      def apply; end
    end
  end
end
