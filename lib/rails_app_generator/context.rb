# frozen_string_literal: true

module RailsAppGenerator
  # Context passes
  class Context
    attr_reader :options

    def initialize(options = {})
      @options = options
      @callbacks = []
    end

    def addons
      AddOns.constants.select { |klass| AddOns.const_get(klass).is_a?(Class) }.map { |klass| AddOns.const_get(klass) }
            .map(&:to_s) # .map(&:name) only works in Ruby 3.0+
            .map(&:underscore)
    end

    # Skippable parts of the default Rails generator, e.g. active_record, active_job...
    def default_addons
      addon_options = addons.map { |option| "skip_#{option}".to_sym }
      skip_options = RailsAppGenerator::AppGenerator.class_options.keys.grep(/skip_/)
      (skip_options - addon_options).map { |option| option.to_s.delete_prefix('skip_').to_sym }
    end
  end
end
