# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add MiniMagick to rails application
    class MiniMagick < Addon
      required_gem gem.version('mini_magick', '4.11.0', 'Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick')

      def apply; end
    end
  end
end
