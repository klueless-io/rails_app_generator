# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Administrate to rails application
    class Administrate < RailsAppGenerator::Addon
      required_gem gem.version('administrate', '0.17.0', 'Administrate is inspired by Rails Admin and ActiveAdmin, but aims to provide a better developer/user experience.')

      def apply
        say 'Setting up Administrate'
      end

      def before_bundle
        say 'Setting up Administrate - before bundle install'
      end

      def after_bundle
        say 'Setting up Administrate - after bundle install'
      end
    end
  end
end
