# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add TwilioRuby to rails application
    class TwilioRuby < RailsAppGenerator::Addon
      required_gem gem.version('twilio-ruby', '5.70.0', 'The official library for communicating with the Twilio REST API, building TwiML, and generating Twilio JWT Capability Tokens')

      def apply
      end
    end
  end
end
