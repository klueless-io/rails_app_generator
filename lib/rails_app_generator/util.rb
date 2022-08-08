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

      def write_last_run(file, data)
        file = File.join('~/dev/kgems/rails_app_generator/docs/last_run/', file)
        write_json(file, data)
      end

      def write_json(file, data)
        file = File.expand_path(file)
        puts "Write to #{file}"
        FileUtils.mkdir_p(File.dirname(file))
        File.write(file, JSON.pretty_generate(data))
      end

      # Take array of Thor::Option and extract the data as a hash
      #
      # You can find the array on the class_options reader
      def thor_options_to_hash(thor_options)
        common_keys = thor_options.flat_map { |o| o.instance_variables }.uniq
        common_keys = common_keys.map { |k| k.to_s.delete_prefix('@').to_sym }

        thor_options.map do |option|
          common_keys.reduce({}) do |result, key|
            result[key] = option.send(key) if option.respond_to?(key)
            result
          end
        end
      end
    end
  end
end
