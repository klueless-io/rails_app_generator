# frozen_string_literal: true

module RailsAppGenerator
  #  Build options for RailsAppGenerator::Starter
  class BuildOptions
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

      def register_option(name, **args)
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

    private

    def default_options
      self.class.registered_options.to_h { |option| [option.name, option.default] }
    end
  end

  # opts = [
  #   "--skip-namespace",
  #   "--skip-collision-check",
  #   "--skip-git",
  #   "--skip-keeps",
  #   "--skip-action-mailer",
  #   "--skip-action-mailbox",
  #   "--skip-action-text",
  #   "--skip-active-record",
  #   "--skip-active-job",
  #   "--skip-active-storage",
  #   "--skip-action-cable",
  #   "--skip-asset-pipeline",
  #   "--skip-javascript",
  #   "--skip-hotwire",
  #   "--skip-jbuilder",
  #   "--skip-test",
  #   "--skip-system-test",
  #   "--skip-bootsnap",
  #   "--skip-bundle"
  # ]

  # opts = [
  #   "--skip-git",
  #   "--skip-test",
  #   "--skip-bundle"
  # ]
end
