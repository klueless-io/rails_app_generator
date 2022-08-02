# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Annotate for ActiveRecord models to rails application
    class Annotate < AddOn
      depends_on :active_record

      required_gem gem.version('annotate', '3.2.0', 'Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.')
      # required_gem gem.version('bob', '1.2.3', 'Something Here with lots of data and other stuff to fill out the comment')
      # required_gem gem.new 'jbuilder', %w[1 2], 'Build JSON APIs with ease [https://github.com/rails/jbuilder]', { xxx: 'yyy', zzz: 'aaa' }, true
      # required_gem gem.version('rails', %w[abc xyz], %(Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"))

      def apply
        template('auto_annotate_models.rake', 'lib/tasks/auto_annotate_models.rake', force: true)
      end
    end
  end
end
