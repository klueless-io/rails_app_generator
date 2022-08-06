# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Rails HTML Sanitizer
    class RailsHtmlSanitizer < RailsAppGenerator::Addon
      required_gem gem.version('rails-html-sanitizer', '1.4.3',
                               'Rails Html Sanitizers are responsible for sanitizing HTML fragments in Rails applications, i.e. in the sanitize, sanitize_css, strip_tags and strip_links methods')

      def apply; end
    end
  end
end
