# frozen_string_literal: true

# lib/rails_app_generator/options/rails_options.rb
#   register_option :add_faker, type: :boolean, default: false

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Faker to rails application
    class Faker < Addon
      required_gem gem.version('faker', '2.22.0', 'Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.')

      def apply; end
    end
  end
end
