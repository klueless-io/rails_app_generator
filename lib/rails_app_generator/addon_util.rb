# frozen_string_literal: true

module RailsAppGenerator
  # Utility methods for accessing Addons
  class AddonUtil
    class << self
      # Get the Addon classes that are stored in the RailsAppGenerator::Addons::* namespace
      def classes
        AddOns.constants
              .map { |addon_klass_name| AddOns.const_get(addon_klass_name) }
              .select { |klass| klass.ancestors.include?(RailsAppGenerator::Addon) }
      end

      # Convert a string to a symbol to a fully qualified class constant
      def get(addon)
        addon = addon.to_s.capitalize.camelize
        "RailsAppGenerator::AddOns::#{addon}".constantize
      end
    end
  end
end
