# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add BundlerAudit to rails application
    class BundlerAudit < RailsAppGenerator::Addon
      required_gem gem.version('bundler-audit', '0.9.1', 'Patch-level verification for Bundler')

      def apply; end
    end
  end
end
