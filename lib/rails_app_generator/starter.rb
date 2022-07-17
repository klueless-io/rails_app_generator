# frozen_string_literal: true

require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  Starter is a wrapper for Rails::AppGenerator
  class Starter
    include KLog::Logging

    attr_reader :app_path
    attr_reader :destination_root
    attr_reader :rails_template_path
    attr_reader :custom_template_path

    def initialize(**args)
      @app_path = args[:app_path] || '.'
      @destination_root = args[:destination_root] || Dir.pwd
      @rails_template_path = args[:rails_template_path] || Rails::Generators::AppGenerator.source_root
      @custom_template_path = args[:custom_template_path] || File.expand_path(File.join(__dir__, '../../templates'))
    end

    def target_path
      File.expand_path(File.join(destination_root, app_path))
    end

    def start
      RailsAppGenerator::AppGenerator.source_root(rails_template_path)
      RailsAppGenerator::AppGenerator.source_paths << rails_template_path
      RailsAppGenerator::AppGenerator.source_paths << custom_template_path

      begin
        RailsAppGenerator::AppGenerator.start ['.', '--skip-bundle', '--skip-git'], destination_root: destination_root  
      rescue => exception
        binding.pry
      end
    end

    # source_paths_for_search
    def start2
      RailsAppGenerator::AppGenerator.source_root(rails_template_path)
      RailsAppGenerator::AppGenerator.source_paths << rails_template_path
      RailsAppGenerator::AppGenerator.source_paths << custom_template_path

      opts = {
        skip_bundle: true,
        skip_git: true
      }

      generator = RailsAppGenerator::AppGenerator.new(['.'], opts, destination_root: destination_root)
      generator.create_root_files
    end

    def start3
      RailsAppGenerator::AppGenerator.source_root(rails_template_path)
      RailsAppGenerator::AppGenerator.source_paths << rails_template_path
      RailsAppGenerator::AppGenerator.source_paths << custom_template_path

      opts = {
        skip_bundle: true,
        skip_git: true
      }

      generator = Rails::Generators::AppGenerator.new(["rails"], opts, destination_root: destination_root)
      generator.create_root

      # RailsAppGenerator::AppGenerator.start([app_path, '--skip-bundle', '--skip-git'])
    end

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
