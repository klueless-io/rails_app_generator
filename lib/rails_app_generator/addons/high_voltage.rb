# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add High Voltage rails engine for static pages.
    class HighVoltage < Addon
      depends_on :views

      def apply
        template('config/initializers/high_voltage.rb')
      end
    end
  end
end
