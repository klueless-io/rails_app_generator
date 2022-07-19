# frozen_string_literal: true

# require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  AppGenerator is a wrapper for Rails::AppGenerator
  class AppGenerator < Rails::Generators::AppGenerator
    def initialize(*args)
      super

      puts options

      # return unless options[:api]

      # self.options = options.merge(
      #   skip_errors: true,
      #   skip_high_voltage: true,
      #   skip_stimulus: true,
      #   skip_tailwind: true,
      #   skip_views: true
      # ).freeze
    end

    def create_test_files
      return if options[:skip_test]

      super if options[:test] == 'minitest'
      # puts options[:testing_framework]

      # add(:rspec) if options[:testing_framework] == 'rspec'
    end

    # include KLog::Logging

    # def finish_template
    #   puts 'finish template'
    #   invoke :rails_customization
    #   super
    # end

    # def fuck
    #   puts 'fuckity'
    # end

    # def rails_customization
    #   puts 'rails customizations'
    #   invoke :fuck
    #   # invoke :customize_gemfile
    #   # invoke :setup_development_environment
    #   # invoke :setup_production_environment
    #   # invoke :setup_secret_token
    #   # invoke :configure_app
    #   # invoke :copy_miscellaneous_files
    #   # invoke :setup_database
    #   # invoke :create_github_repo
    #   # binding.pry
    #   # invoke :generate_default
    #   # invoke :create_heroku_apps
    #   # invoke :generate_deployment_default
    #   # invoke :remove_config_comment_lines
    #   # invoke :remove_routes_comment_lines
    #   # invoke :outro
    # end

    # def xxx_generate_default
    #   puts 'xxx_generate_default'
    #   # binding.pry
    #   # run("spring stop > /dev/null 2>&1 || true")
    #   generate("rails_app_generator:foo")
    #   # generate("suspenders:runner")
    #   # generate("suspenders:profiler")
    #   # generate("suspenders:json")
    #   # generate("suspenders:static")
    #   # generate("suspenders:stylesheet_base") unless options[:api]
    #   # generate("suspenders:testing")
    #   # generate("suspenders:ci")
    #   # generate("suspenders:js_driver")
    #   # generate("suspenders:forms") unless options[:api]
    #   # generate("suspenders:db_optimizations")
    #   # generate("suspenders:factories")
    #   # generate("suspenders:lint")
    #   # generate("suspenders:jobs")
    #   # generate("suspenders:analytics")
    #   # generate("suspenders:inline_svg")
    #   # generate("suspenders:advisories")
    # end

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
