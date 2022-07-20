# frozen_string_literal: true

module RailsAppGenerator
  # XXXX
  class AddOn < Rails::Generators::Base
    include Thor::Actions
    include Rails::Generators::Actions
    include Rails::Generators::AppName

    attr_reader :dependencies, :context

    def initialize(context)
      super
      @context = context
      @dependencies = self.class.dependencies || []
    end

    def apply; end

    no_commands do
      # list any methods that you want access to, but not to be exposed as a thor command
      def options
        @context.options
      end

      def uses?(identifier = nil)
        identifier ||= self.class.identifier
        options = @context.options
        return false if options["skip_#{identifier}".to_sym]

        return true if @context.default_addons.include?(identifier)

        klass = identifier.nil? ? self.class : self.class.get(identifier)
        Dependencies.new(klass, @context).satisfied?
      end

      def source_paths
        paths = RailsAppGenerator::AppGenerator.source_paths
        paths << "/Users/davidcruwys/dev/kgems/rails_app_generator/templates/addons/#{self.class.identifier}"
        paths
      end

      #   def find_in_source_paths(file)
      #     puts "yyyyyyyyyyyyyyyyyyyyyy: #{file}"
      #     possible_files = [file, file + Thor::TEMPLATE_EXTNAME]
      #     relative_root = relative_to_original_destination_root(destination_root, false)

      #     source_paths.each do |source|
      #       possible_files.each do |f|
      #         source_file = File.expand_path(f, File.join(source, relative_root))
      #         return source_file if File.exist?(source_file)
      #       end
      #     end

      #     message = "Could not find #{file.inspect} in any of your source paths. ".dup

      #     unless self.class.source_root
      #       message << "Please invoke #{self.class.name}.source_root(PATH) with the PATH containing your templates. "
      #     end

      #     message << if source_paths.empty?
      #                  "Currently you have no source paths."
      #                else
      #                  "Your current source paths are: \n#{source_paths.join("\n")}"
      #                end

      #     raise Error, message
      #   end
    end

    class << self
      # def default_source_root
      #   puts 'am I every called - default_source_root?'
      #   # Is there a better way to do this?
      #   # eg Could I transfer the configured source roots to the AddOn class?
      #   File.expand_path(File.join('..', '..', 'templates'), __dir__)
      # end

      def apply(context = Context.new({}))
        instance = new(context)
        return unless instance.uses?

        instance.apply
      end

      def get(addon)
        addon = addon.to_s.capitalize.camelize
        "RailsAppGenerator::AddOns::#{addon}".constantize
      end

      def identifier
        name.demodulize.underscore.to_sym
      end

      def dependencies
        @dependencies ||= []
      end

      puts 'about to add find_in_source_paths: lib/rails_app_generator/add_on.rb'
      def xmen; end

      protected

      def depends_on(*addon)
        puts addon
        @dependencies = addon.map(&:to_sym)
      end
    end
  end
end
