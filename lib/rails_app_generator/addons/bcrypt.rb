# frozen_string_literal: true

# lib/rails_app_generator/rag_initializer.rb

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Bcrypt to rails application
    class Bcrypt < RailsAppGenerator::Addon
      required_gem gem.version('bcrypt', '3.1.18', 'bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords.')

      def apply
        say 'Setting up Bcrypt'
      end

      def before_bundle
        say 'Setting up Bcrypt - before bundle install'
      end

      def after_bundle
        say 'Setting up Bcrypt - after bundle install'
      end
    end
  end
end
