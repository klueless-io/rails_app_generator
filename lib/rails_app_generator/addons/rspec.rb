# frozen_string_literal: true

# lib/rails_app_generator/rag_initializer.rb
# add_if(:rspec)
# rag.add_option :add_rspec            , type: :boolean, default: false

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rspec to rails application
    class Rspec < RailsAppGenerator::Addon
      required_gem gem.version('rspec', '3.11.0', 'BDD for Ruby')

      depends_on :test

      def apply
        create_file('.rspec', '--require spec_helper')
        template('spec/rails_helper.rb')
        template('spec/spec_helper.rb')
      end
    end
  end
end
