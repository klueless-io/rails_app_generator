# frozen_string_literal: true

module RailsAppGenerator
  # OptionBuilder can work standalone or as the base class
  # for application generator options used by RailsAppGenerator::Starter
  class OptionsBuilder
    attr_reader :options

    def initialize(opts)
      # @opts = opts
      @options = default_options
      @options.merge!(opts)
    end

    class << self
      def class_options
        @class_options ||= []
      end

      def class_options_lookup
        @class_options_lookup ||= {}
      end

      # Register an option with the builder, this method has the same signature as Thor.
      #
      # This is so options can be used interchangeably between OptionsBuilder and Thor.
      def class_option(name, **args)
        option = BuildOption.new(name, **args)

        add_class_option(option)
      end

      def add_class_option(option)
        if class_options_lookup.key?(option.name)
          # raise ArgumentError, "Option #{option.name} already registered"
          puts "Option #{option.name} already registered"
          return
        end

        class_options_lookup[option.name.to_sym] = option
        class_options << option
      end

      def add_thor_class_option(thor_option)
        args = {
          description: thor_option.description,
          type: thor_option.type,
          default: thor_option.default,
          required: thor_option.required
        }
        option = BuildOption.new(thor_option.name, **args)

        add_class_option(option)
      end

      def reset
        @class_options = nil
        @class_options_lookup = nil
      end

      def to_h
        {
          class_option_keys: class_options.map(&:name),
          class_options: class_options.map(&:to_h)
        }
      end
    end

    # rubocop:disable Metrics/AbcSize
    def cmd_line_options
      available_options = options.clone

      result = self.class.class_options.map do |option|
        mapper = option.mapper
        key = option.name.to_sym
        value = options[key]
        available_options.delete(key)
        # if available_options.delete(option.name.to_sym)
        #   puts "option IS  registered: #{option.name}"
        # else
        #   puts "option not registered: #{option.name}"
        # end

        mapper.map(option.name, value)
      end.reject(&:blank?)

      return result if available_options.empty?

      puts "options not registered: #{available_options.keys.join(', ')}"
      result
      # raise 'Unknown options'
    end
    # rubocop:enable Metrics/AbcSize

    def debug
      puts '[ Options JSON ]----------------------------------------------------'
      puts JSON.pretty_generate(options)
      puts '[ Options Command Line ]--------------------------------------------'
      puts cmd_line_options
    end

    def to_h
      {
        options: options
      }
    end

    private

    def default_options
      self.class.class_options.to_h { |option| [option.name.to_sym, option.default] }
    end
  end
end
