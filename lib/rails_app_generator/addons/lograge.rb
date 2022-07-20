# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add LogRage - Tame Rails' multi-line logging into a single line per request
    class Lograge < AddOn
      def apply
        template 'config/initializers/lograge.rb'
      end
    end
  end
end
