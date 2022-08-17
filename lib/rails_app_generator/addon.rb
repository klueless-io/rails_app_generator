# frozen_string_literal: true

module RailsAppGenerator
  # Base class for all add-ons
  class Addon < Rails::Generators::Base
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
    # rubocop:disable Metrics/BlockLength
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

      def add_flag?(option_name)
        value = options["add_#{option_name}".to_sym]

        return false if value.nil?

        value == true
      end

      def active?(option_name)
        add_flag?(option_name) # || !skip_flag?(option_name)
      end

      def option?(option_name)
        !options[option_name.to_sym].nil?
      end

      def uses?(addon_name = nil)
        addon_name ||= self.class.addon_name

        return false  if options["skip_#{addon_name}".to_sym]
        return true   if context.default_addons.include?(addon_name)

        klass = addon_name.nil? ? self.class : AddonUtil.get(addon_name)
        Dependencies.new(klass, context).satisfied?
      end

      def read_template(template_file)
        path = find_in_source_paths(template_file)

        File.read(path)
      end

      # Moves a file at given location, to another location. Both files are relative to the destination_root
      #
      # ==== Parameters
      # path<String>:: source_path of the file to be moved (relative to destination_root)
      # path<String>:: target_path of the file moving to (relative to destination_root)
      # config<Hash>:: give :verbose => false to not log the status.
      #
      # ==== Example
      #
      #   move_file 'README', 'readme.md'
      #   move_file 'config/xmen.sample.yml', 'config/xmen.yml
      #
      # rubocop:disable Metrics/AbcSize
      def move_file(source_path, target_path, config = {})
        source = File.expand_path(source_path, destination_root)
        target = File.expand_path(target_path, destination_root)
        config.merge!({ verbose: true })

        say_status :move_file_source, relative_to_original_destination_root(source), config.fetch(:verbose, true)
        say_status :move_file_source, relative_to_original_destination_root(target), config.fetch(:verbose, true)

        return unless !options[:pretend] && File.exist?(source)

        require 'fileutils'
        ::FileUtils.mv(source, target)
      end
      # rubocop:enable Metrics/AbcSize
    end
    # rubocop:enable Metrics/BlockLength

    class << self
      def addon_name
        name.demodulize.underscore.to_sym
      end

      def dependencies
        @dependencies ||= []
      end

      def gem_entries
        @gem_entries ||= []
      end

      def depends_on(*addon)
        @dependencies = addon.map(&:to_sym)
      end

      def required_gem(gem_entry)
        existing_gem = gem_entries.find { |gem| gem.name == gem_entry.name }

        if existing_gem
          return if Gem::Version.new(gem_entry.version) < Gem::Version.new(existing_gem.version)

          existing_gem.version = gem_entry.version
          existing_gem.comment = gem_entry.comment
          return
        end

        gem_entries << gem_entry
      end

      def reset_gem_entries
        @gem_entries = []
      end

      def gem
        Rails::Generators::AppBase::GemfileEntry
      end
    end
  end
end
