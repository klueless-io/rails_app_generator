# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add RestClient to rails application
    class RestClient < AddOn
      required_gem gem.version('rest-client', '2.1.0', 'A simple HTTP and REST client for Ruby, inspired by the Sinatra microframework style of specifying actions: get, put, post, delete.')

      def apply; end
    end
  end
end
