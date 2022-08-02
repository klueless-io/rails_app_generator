# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Xmen to rails application
    class Xmen < AddOn
      # depends_on :active_record

      # required_gem gem.version('annotate', '3.2.0', 'Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.')

      def apply
        template('auto_annotate_models.rake', 'lib/tasks/auto_annotate_models.rake', force: true)
      end
    end
  end
end
