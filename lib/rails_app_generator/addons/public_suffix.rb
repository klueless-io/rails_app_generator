# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add PublicSuffix to rails application
    class PublicSuffix < RailsAppGenerator::Addon
      required_gem gem.version('public_suffix', '5.0.0', 'PublicSuffix can parse and decompose a domain name into top level domain, domain and subdomains.')

      def apply
      end
    end
  end
end
