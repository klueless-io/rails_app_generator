# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add BcryptRuby to rails application
    class BcryptRuby < RailsAppGenerator::Addon
      required_gem gem.version('bcrypt-ruby', '3.1.5', 'bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords.')

      # If you are using Rails you should probably be using
      # <code>ActiveModel::SecurePassword</code> instead of using bcrypt
      def apply; end
    end
  end
end
