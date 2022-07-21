# frozen_string_literal: true

module RailsAppGenerator
  # Context passes
  class Context
    attr_reader :rails_template_path
    attr_reader :rails_override_template_path
    attr_reader :addon_template_path

    attr_reader :options

    # Build a context object from the given arguments to be passed around within Rails Generator and AddOns.
    #
    # @param rails_template_path [String] The path to the Rails template.
    # @param rails_override_template_path [String] This is the path to the templates that will override the default Rails templates.
    # @param addon_template_path [String] The path to the addon's templates.
    # @param options [Hash] A hash of options that can be used to customize the template. Defaults to {}
    def initialize(rails_template_path, rails_override_template_path, addon_template_path, options = {})
      @rails_template_path = rails_template_path
      @rails_override_template_path = rails_override_template_path
      @addon_template_path = addon_template_path

      @options = options
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

    def debug
      kv('rails_template_path', rails_template_path)
      kv('rails_override_template_path', rails_override_template_path)
      kv('addon_template_path', addon_template_path)

      debug_default_addons
      debug_addons
      debug_options
    end

    private

    def debug_default_addons
      puts '-[ default_addons ]--------------------------------------------'
      default_addons.each { |addon| puts addon }
    end

    def debug_addons
      puts '-[ addons ]----------------------------------------------------'
      addons.each { |addon| puts addon }
    end

    def debug_options
      puts '-[ options ]----------------------------------------------------'
      options.each { |key, value| kv(key, value) }
    end

    def kv(label, value, len = 35)
      return ' ' * len if label.nil?

      label = label.to_s if label.is_a?(Symbol)
      label = label.length > len ? label.slice(0..len) : label.ljust(len, ' ')

      puts "#{label}: #{value}"
    end
  end
end
