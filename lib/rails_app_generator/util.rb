# frozen_string_literal: true

module RailsAppGenerator
  # Utility methods
  class Util
    class << self
      # Log KeyValue pair
      #
      # @example
      #   Util.kv(:key, :value)
      def kv(label, value, len = 35)
        return ' ' * len if label.nil?

        label = label.to_s if label.is_a?(Symbol)
        label = label.length > len ? label.slice(0..len) : label.ljust(len, ' ')

        puts "#{label}: #{value}"
      end

      def line(heading, len = 80)
        heading = "- [ #{heading} ]"
        puts heading.length > len ? heading : heading.ljust(len, '-')
      end
    end
  end
end
