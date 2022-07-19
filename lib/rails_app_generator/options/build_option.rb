# frozen_string_literal: true

module RailsAppGenerator
  # Option for the rails generator
  #
  # This class maps closely (but not exactly) to Thor's options
  # The pattern is not exactly the same, it is easy to map the options
  # you need from other generators such as: railties/lib/rails/generators/app_base.rb
  #
  # @example
  # class_option    :skip_git, type: :boolean, default: false, desc: "Skip .gitignore file"
  # becomes
  # register_option :skip_git, type: :boolean, default: false, desc: "Skip .gitignore file"
  class BuildOption
    attr_reader :name, :desc, :type, :default, :required, :mapper

    def initialize(**args)
      @name = args[:name]
      @desc = args[:desc] || ''
      @type = args[:type] || :string
      @required = args.fetch(:required, false)
      @default = args[:default] || sane_default
      @mapper = args[:mapper] || sane_mapper

      raise ArgumentError, ':required should not be nil' if @required.nil?
    end

    def cmd_option(value); end

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

    def sane_mapper
      case type
      when :boolean
        RailsAppGenerator::MapOptionBooleanFlag
      else
        RailsAppGenerator::MapOptionValue
      end
    end
  end
end
