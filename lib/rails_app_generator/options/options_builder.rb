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
      def registered_options
        @registered_options ||= []
      end

      def registered_options_lookup
        @registered_options_lookup ||= {}
      end

      # Future options are placeholders for options that are not yet implemented
      def future_option(name, **args); end

      # Register an option with the builder, this method has the same signature as Thor.
      # 
      # This is so options can be used interchangeably between OptionsBuilder and Thor.
      def class_option(name, **args)
        return if registered_options_lookup.key?(name)

        option = BuildOption.new(**{ name: name }.merge(args))

        registered_options_lookup[name] = option
        registered_options << option
      end

      def reset
        @registered_options = nil
        @registered_options_lookup = nil
      end
    end

    def cmd_line_options
      self.class.registered_options.map do |option|
        mapper = option.mapper
        value = options[option.name]
        mapper.map(option.name, value)
      end.reject(&:blank?)
    end

    def debug
      puts '[ Options JSON ]----------------------------------------------------'
      puts JSON.pretty_generate(options)
      puts '[ Options Command Line ]--------------------------------------------'
      puts cmd_line_options
    end

    private

    def default_options
      self.class.registered_options.to_h { |option| [option.name, option.default] }
    end
  end
end
