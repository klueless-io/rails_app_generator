# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add RSpec unit testing support to rails application
    class Rspec < RailsAppGenerator::Addon
      depends_on :test

      def apply
        create_file('.rspec', '--require spec_helper')
        template('spec/rails_helper.rb')
        template('spec/spec_helper.rb')
      end
    end
  end
end
