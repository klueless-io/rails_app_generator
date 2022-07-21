# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add InlineSvg support to rails application
    class InlineSvg < AddOn
      depends_on :views
    end
  end
end
