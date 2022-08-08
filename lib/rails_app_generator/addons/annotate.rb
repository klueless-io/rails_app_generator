# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Annotate for ActiveRecord models to rails application
    class Annotate < RailsAppGenerator::Addon
      depends_on :active_record

      required_gem gem.version('annotate', '3.2.0', 'Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.')

      def apply
        template('auto_annotate_models.rake', 'lib/tasks/auto_annotate_models.rake', force: true)
      end
    end
  end
end
