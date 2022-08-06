# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Httparty to rails application
    class Httparty < Addon
      required_gem gem.version('httparty', '0.20.0', 'Makes http fun! Also, makes consuming restful web services dead easy.')

      def apply; end
    end
  end
end
