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

      def register(name, **args)
        registered_options << BuildOption.new(**{ name: name }.merge(args))
      end

      def reset
        @registered_options = nil
      end
    end

    def rails_options
      build_options

      []
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
