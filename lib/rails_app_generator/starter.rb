# frozen_string_literal: true

require 'suspenders'
require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  Starter is a wrapper for Rails::AppGenerator (it follows composition over inheritance)
  class Starter
    include KLog::Logging

    attr_reader :app_path
    attr_reader :rails_template_path
    attr_reader :custom_template_path

    def initialize(app_path = Dir.pwd)
      @app_path = app_path
      @rails_template_path = Rails::Generators::AppGenerator.source_root
      @custom_template_path = File.expand_path(File.join(__dir__, '../../templates'))
    end

    def template_paths
      [
        @rails_template_path,
        @custom_template_path
      ]
    end

    # Source paths represent the paths where templates can be found
    # The first path entry is searched first, followed by the second, and so on.
    #
    # IF you don't set this property then it will default to template_paths
    # Railties Template path + Rails App Generator Template path
    def source_paths
      @source_paths ||= template_paths
    end

    # def initialize(*args, **opts) #@, **opts)
    #   # @app_path = opts[:app_path]
    #   super(*args) # , **opts)

    #   gem_path = Gem.loaded_specs["railties"].full_gem_path
    # end

    def start
      # return dry_run if dry_run?

      # run_rails_generator1
    end

    # def dry_run?
    #   @dry_run == true
    # end

    # # private

    # def run_rails_generator1
    #   #   gem_path = Gem.loaded_specs["railties"].full_gem_path
    #   #   # lib/rails/generators/rails/app/templates
    #   #   templates_root = File.expand_path(File.join(gem_path, "lib/rails/generators/rails/app/templates"))

    #   # Rails::AppGenerator.source_root templates_root
    #   # destination_root = "/Users/davidcruwys/dev/kweb/xmen"

    #   # Rails::Generators::AppGenerator.start [app_path, '--skip-bundle']

    #   gem_path = Gem.loaded_specs["suspenders"].full_gem_path
    #   templates_root = File.expand_path(File.join(gem_path, "templates"))

    #   Suspenders::AppGenerator.source_root templates_root
    #   Suspenders::AppGenerator.source_paths << Rails::Generators::AppGenerator.source_root << templates_root

    #   puts '--------------------------------------------------------------'
    #   puts "1 #{templates_root}"
    #   puts "2 #{Suspenders::AppGenerator.source_root}"
    #   puts "3 #{Suspenders::AppGenerator.source_paths}"
    #   puts "4 #{Rails::Generators::AppGenerator.source_root}"

    #   opts = {}

    #   # generator = KStarter::AppGenerator.new([folder], opts)
    #   # generator.destination_root = destination_root
    #   FileUtils.rm_rf(app_path)

    #   Suspenders::AppGenerator.start([app_path, '--skip-bundle'])
    # end

    # def run_rails_generator2
    #   gem_path = Gem.loaded_specs["rails_app_generator"].full_gem_path
    #   templates_root = File.expand_path(File.join(gem_path, "templates"))

    #   puts '--------------------------------------------------------------'
    #   puts "1 #{templates_root}"
    #   puts "2 #{Rails::Generators::AppGenerator.source_root}"
    #   puts "3 #{Rails::Generators::AppGenerator.source_paths}"
    #   puts "4 #{Rails::Generators::AppGenerator.source_root}"

    #   opts = {}

    #   # generator = KStarter::AppGenerator.new([folder], opts)
    #   # generator.destination_root = destination_root
    #   FileUtils.rm_rf(app_path)

    #   Rails::Generators::AppGenerator.start([app_path, '--skip-bundle'])
    # end

    # def dry_run
    #   @dry_run_info = DryRunInfo.new(
    #     app_path: app_path
    #   )

    #   # Rails::Generators::AppGenerator.source_root(defaults_rails_templates)

    #   opts = {}

    #   # KStarter::AppGenerator.source_root(defaults_rails_templates)
    #   # Rails::Generators::AppGenerator

    #   generator = Rails::Generators::AppGenerator.new([app_path], opts)
    #   generator.app_path
    #   # generator.destination_root = destination_root
    #   # generator.destination_root
    #   generator.source_paths
    #   generator.class.source_root
    #   # => ["/Users/davidcruwys/.asdf/installs/ruby/2.7.6/lib/ruby/gems/2.7.0/gems/railties-7.0.3.1/lib/rails/generators/rails/app/templates"]
    #   # g.find_in_source_paths('README.MD')

    #   # FileUtils.rm_rf(destination_root)

    #   # generator.destination_root

    #   log.structure(dry_run_info)

    # end
  end
end
