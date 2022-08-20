# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add ImageProcessing to rails application
    class ImageProcessing < RailsAppGenerator::Addon
      required_gem gem.version('image_processing', '1.12.2', '')

      def apply
        say 'Setting up ImageProcessing'
      end

      def before_template
      end

      def before_bundle
      end

      def after_bundle
      end
    end
  end
end
