# frozen_string_literal: true

module RailsAppGenerator
  # XXXX
  class AddOn < Rails::Generators::Base
    include Thor::Actions
    include Rails::Generators::Actions
    include Rails::Generators::AppName

    attr_reader :context
    attr_reader :gem_entries
    attr_reader :dependencies

    def initialize(context)
      super
      @context = context
      @dependencies = self.class.dependencies || []
      @gem_entries = self.class.gem_entries || []
    end

    def apply; end

    # list any methods that you want access to, but not to be exposed as a thor command
    no_commands do
      def source_paths
        [
          format(context.addon_template_path, addon: self.class.addon_name.to_s),
          context.rails_override_template_path,
          context.rails_template_path
        ]
      end

      def options
        context.options
      end

      def uses?(addon_name = nil)
        addon_name ||= self.class.addon_name

        return false  if options["skip_#{addon_name}".to_sym]
        return true   if context.default_addons.include?(addon_name)

        klass = addon_name.nil? ? self.class : self.class.get(addon_name)
        Dependencies.new(klass, context).satisfied?
      end
    end

    class << self
      def apply(context = Context.new({}))
        instance = new(context)
        return unless instance.uses?

        instance.apply
      end

      def get(addon)
        addon = addon.to_s.capitalize.camelize
        "RailsAppGenerator::AddOns::#{addon}".constantize
      end

      def addon_name
        name.demodulize.underscore.to_sym
      end

      def dependencies
        @dependencies ||= []
      end

      def gem_entries
        @gem_entries ||= []
      end

      protected

      def depends_on(*addon)
        @dependencies = addon.map(&:to_sym)
      end

      def required_gem(gem_entry)
        gem_entries << gem_entry
      end

      def gem
        Rails::Generators::AppBase::GemfileEntry
      end
    end
  end
end
