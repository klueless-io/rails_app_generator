

# frozen_string_literal: true

require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  AppGenerator is a wrapper for Rails::AppGenerator (it follows composition over inheritance)
  class AppGenerator < Rails::Generators::AppGenerator
    include KLog::Logging

   
    # private

    # def run_rails_generator1
    #   #   gem_path = Gem.loaded_specs["railties"].full_gem_path
    #   #   # lib/rails/generators/rails/app/templates
    #   #   templates_root = File.expand_path(File.join(gem_path, "lib/rails/generators/rails/app/templates"))

    #   # Rails::AppGenerator.source_root templates_root
    #   # destination_root = "/Users/davidcruwys/dev/kweb/xmen"

    #   # Rails::Generators::AppGenerator.start [output_folder, '--skip-bundle']

    #   gem_path = Gem.loaded_specs['suspenders'].full_gem_path
    #   templates_root = File.expand_path(File.join(gem_path, 'templates'))

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
    #   FileUtils.rm_rf(output_folder)

    #   Suspenders::AppGenerator.start([output_folder, '--skip-bundle'])
    # end

    # def run_rails_generator2
    #   gem_path = Gem.loaded_specs['rails_app_generator'].full_gem_path
    #   templates_root = File.expand_path(File.join(gem_path, 'templates'))

    #   puts '--------------------------------------------------------------'
    #   puts "1 #{templates_root}"
    #   puts "2 #{Rails::Generators::AppGenerator.source_root}"
    #   puts "3 #{Rails::Generators::AppGenerator.source_paths}"
    #   puts "4 #{Rails::Generators::AppGenerator.source_root}"

    #   opts = {}

    #   # generator = KStarter::AppGenerator.new([folder], opts)
    #   # generator.destination_root = destination_root
    #   FileUtils.rm_rf(output_folder)

    #   Rails::Generators::AppGenerator.start([output_folder, '--skip-bundle'])
    # end

    # def dry_run
    #   @dry_run_info = DryRunInfo.new(
    #     output_folder: output_folder
    #   )

    #   # Rails::Generators::AppGenerator.source_root(defaults_rails_templates)

    #   opts = {}

    #   # KStarter::AppGenerator.source_root(defaults_rails_templates)
    #   # Rails::Generators::AppGenerator

    #   generator = Rails::Generators::AppGenerator.new([output_folder], opts)
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
