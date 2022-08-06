# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Stimulus components
    class Stimulus < Addon
      depends_on :javascript

      def apply
        rails_command('stimulus:install')
      end
    end
  end
end
