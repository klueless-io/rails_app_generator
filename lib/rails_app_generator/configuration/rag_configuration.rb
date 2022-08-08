# frozen_string_literal: true

module RailsAppGenerator
  # Structure for storing Rails Application Generator configuration
  class RagConfiguration
    # include KLog::Logging

    attr_reader :options

    def initialize
      @options = []
    end

    def add_option(name, **args)
      @options << RailsAppGenerator::BuildOption.new(name, **args)
    end
  end
end
