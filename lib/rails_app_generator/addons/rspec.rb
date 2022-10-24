# frozen_string_literal: true

require 'pry'
# lib/rails_app_generator/rag_initializer.rb
# add_if(:rspec)
# rag.add_option :add_rspec            , type: :boolean, default: false

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rspec to rails application
    class Rspec < RailsAppGenerator::Addon
      required_gem gem.version('rspec', '3.11.0', 'BDD for Ruby')

      # THIS DOES NOT WORK WHEN USING CAPYBARA, I NEED TO Figure out the dependency issues
      depends_on :test

      def apply
        # NOTE: NONE OF THIS IS WORKING
        create_file('.rspec', '--require spec_helper')
        template('spec/rails_helper.rb')
        template('spec/spec_helper.rb')
      end
    end
  end
end
