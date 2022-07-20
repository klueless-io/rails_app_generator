# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Annotate for ActiveRecord models to rails application
    class Annotate < AddOn
      depends_on :active_record

      def apply
        template('auto_annotate_models.rake', 'lib/tasks/auto_annotate_models.rake', force: true)
      end
    end
  end
end
