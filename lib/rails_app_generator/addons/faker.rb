# frozen_string_literal: true

# lib/rails_app_generator/options/rails_options.rb
#   register_option :add_faker, type: :boolean, default: false

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Faker to rails application
    class Faker < AddOn
      required_gem gem.version('faker', '2.22.0', 'Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.')

      def apply
        # say 'Setting up Faker'
        # template('faker_template.rb', 'target/faker.rb', force: true)
        # template('app/javascript/stylesheets/components.scss')
        # create_file('target/faker.rb', 'put your content here')
        # directory 'app/template', 'app/target', force: true
        # empty_directory 'app/target'
        # inject_into_file('app/application.js', "some content")
        # rails_command('tailwindcss:install')
      end
    end
  end
end
