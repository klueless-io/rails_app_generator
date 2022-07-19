# frozen_string_literal: true

module RailsAppGenerator
  class Option
    attr_reader :name, :description, :type, :default, :required

    def initialize(**args)
      @name = args[:name]
      @description = args[:description] || ''
      @type = args[:type] || :string
      @required = args.fetch(:required, false)
      @default = args.fetch(:default, sane_default)
    end

    private

    def sane_default
      case type
      when :string
        ''
      when :boolean
        false
      when :integer
        0
      when :array
        []
      when :hash
        {}
      end
    end
  end

  #  Build options for RailsAppGenerator::Starter
  class BuildOptions
    attr_reader :opts

    def initialize(opts)
      # @opts = opts
    end

    class << self
      def registered_options
        @registered_options ||= []
      end

      def register(name, **args)
        registered_options << Option.new(**{ name: name }.merge(args))
      end
    end

    def rails_options
      build_options

      []
    end

    def options
      build_options
    end

    private

    def build_options
      default_options
    end

    def default_options
      return @default_options unless @default_options.nil?

      @default_options = begin
        o = {}

        self.class.registered_options.each do |option|
          o[option.name] = nil
        end

        o
      end
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
