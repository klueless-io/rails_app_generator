# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Chartkick to rails application
    class Chartkick < AddOn
      required_gem gem.version('chartkick', '4.2.1', 'Create beautiful JavaScript charts with one line of Ruby')

      def apply; end

      def after_bundle
        append_to_file('config/importmap.rb', <<~RUBY)
          pin "chartkick", to: "chartkick.js"
          pin "Chart.bundle", to: "Chart.bundle.js"
        RUBY

        append_to_file('app/javascript/application.js', <<~RUBY)
          import "chartkick"
          import "Chart.bundle"
        RUBY
      end
    end
  end
end
