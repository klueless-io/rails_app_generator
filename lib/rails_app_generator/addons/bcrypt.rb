# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Bcrypt to rails application
    class Bcrypt < RailsAppGenerator::Addon
      required_gem gem.version('bcrypt', '3.1.18', 'bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords.')

      # If you are using Rails you should probably be using
      # <code>ActiveModel::SecurePassword</code> instead of using bcrypt
      def apply; end
    end
  end
end
