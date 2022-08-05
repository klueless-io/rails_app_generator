# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Chartkick to rails application
    class Chartkick < AddOn
      required_gem gem.version('chartkick', '4.2.1', 'Create beautiful JavaScript charts with one line of Ruby')

      def apply
        # say 'Setting up Chartkick'
        # template('chartkick_template.rb', 'target/chartkick.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/chartkick.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
        add_to_file('config/importmap.rb', <<-RUBY)
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js
        RUBY

      end
    end
  end
end


