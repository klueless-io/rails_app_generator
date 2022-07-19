# frozen_string_literal: true

module RailsAppGenerator
  class BuildOption
    attr_reader :name, :description, :type, :default, :required

    def initialize(**args)
      @name = args[:name]
      @description = args[:description] || ''
      @type = args[:type] || :string
      @required = args.fetch(:required, false)
      @default = args[:default] || sane_default

      raise ArgumentError, ':required should not be nil' if @required.nil?
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
end
