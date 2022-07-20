# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add FactoryBot to rails application
    class FactoryBot < AddOn
      depends_on :active_record, :test

      def apply
        # TODO: Make this work for minitest
        return unless uses?(:factory_bot)

        empty_directory 'spec/factories'
        template('spec/support/factory_bot.rb')
      end
    end
  end
end
