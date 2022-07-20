# frozen_string_literal: true

# require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  AppGenerator is a wrapper for Rails::AppGenerator
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :test, type: :string, default: 'rspec'

    class_option :add_irbrc                   , type: :boolean, default: false
    class_option :add_foreman                 , type: :boolean, default: false
    class_option :add_dotenv                  , type: :boolean, default: false
    class_option :add_docker                  , type: :boolean, default: false
    class_option :add_docker_compose          , type: :boolean, default: false
    class_option :add_rubocop                 , type: :boolean, default: false
    class_option :add_annotate                , type: :boolean, default: false
    class_option :add_continuous_integration  , type: :boolean, default: false
    class_option :add_high_voltage            , type: :boolean, default: false
    class_option :add_generators              , type: :boolean, default: false
    class_option :add_lograge                 , type: :boolean, default: false
    class_option :add_pundit                  , type: :boolean, default: false
    class_option :add_services                , type: :boolean, default: false
    class_option :add_sidekiq                 , type: :boolean, default: false
    class_option :add_views                   , type: :boolean, default: false
    class_option :add_errors                 , type: :boolean, default: false
    class_option :add_scaffold               , type: :boolean, default: false
    class_option :add_factory_bot             , type: :boolean, default: false
    class_option :add_shoulda                 , type: :boolean, default: false

    # points to the original rails templates
    attr_reader :rails_template_path

    # points to template path where you can override the standard rails templates
    attr_reader :rails_override_template_path

    # points to template path for rails addons
    attr_reader :addon_template_path

    def initialize(args, *options)
      super

      @rails_template_path            = self.class.rails_template_path
      @rails_override_template_path   = self.class.rails_override_template_path
      @addon_template_path            = self.class.addon_template_path
    end

    class << self
      # points to the original rails templates
      attr_writer :rails_template_path

      # AppGenerator.source_root
      def rails_template_path
        @rails_template_path ||= File.join(Gem.loaded_specs['railties'].full_gem_path, 'lib/rails/generators/rails/app/templates')
      end

      # points to the custom templates related to rails
      attr_writer :rails_override_template_path

      def rails_override_template_path
        @rails_override_template_path ||= File.join(Gem.loaded_specs['rails_app_generator'].full_gem_path, 'templates')
      end

      # points to templates related to rails addons
      attr_writer :addon_template_path

      def addon_template_path
        @addon_template_path ||= File.join(Gem.loaded_specs['rails_app_generator'].full_gem_path, "templates/addons/#{addon_name}")
      end
    end

    # def source_paths
    #   # ['/whatever', './templates']
    #   super
    # end

    # def initialize(*args)
    #   super

    #   # puts '----------------------------------------------------'
    #   # puts options
    #   # puts '----------------------------------------------------'

    #   # return unless options[:api]

    #   # self.options = options.merge(
    #   #   skip_errors: true,
    #   #   skip_high_voltage: true,
    #   #   skip_stimulus: true,
    #   #   skip_tailwind: true,
    #   #   skip_views: true
    #   # ).freeze
    # end

    def create_test_files
      return if options[:skip_test]

      super if options[:test] == 'minitest'
      # puts options[:testing_framework]

      # add(:rspec) if options[:testing_framework] == 'rspec'
    end

    # rubocop:disable Metrics/AbcSize
    def create_root_files
      super

      add(:irbrc)                           if options[:add_irbrc]
      add(:foreman)                         if options[:add_foreman]
      add(:dotenv)                          if options[:add_dotenv]
      add(:docker)                          if options[:add_docker]
      add(:docker_compose)                  if options[:add_docker_compose]
      add(:rubocop)                         if options[:add_rubocop]
    end
    # rubocop:enable Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    def finish_template
      puts 'finish template'

      add(:annotate)                        if options[:add_annotate]
      add(:continuous_integration)          if options[:add_continuous_integration]
      add(:high_voltage)                    if options[:add_high_voltage]
      add(:generators)                      if options[:add_generators]
      add(:lograge)                         if options[:add_lograge]
      add(:pundit)                          if options[:add_pundit]
      add(:services)                        if options[:add_services]
      add(:sidekiq)                         if options[:add_sidekiq]
      add(:views, :errors, :scaffold)       if options[:add_views]
      add(:factory_bot)                     if options[:add_factory_bot]
      add(:shoulda)                         if options[:add_shoulda]

      # invoke :rails_customization
      super
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity

    no_commands do
      # Context wraps the configured options and can be made available to addons
      def context
        @context ||= Context.new(options)
      end

      def add(*addons)
        addons.each do |addon|
          addon = addon.to_s.capitalize.camelize
          addon = "RailsAppGenerator::AddOns::#{addon}"

          addon.constantize.apply(context)
        end
      end
    end

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
  end
end
