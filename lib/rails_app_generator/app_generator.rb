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

    class << self
      # points to the original rails templates
      attr_writer :rails_template_path

      def rails_template_path
        @rails_template_path ||= gem_template_path('railties', 'lib/rails/generators/rails/app/templates')
      end

      # points to the custom templates related to rails
      attr_writer :override_template_path

      def override_template_path
        @override_template_path ||= gem_template_path('rails_app_generator', 'templates')
      end

      # points to templates related to rails addons
      attr_writer :addon_template_path

      def addon_template_path
        @addon_template_path ||= gem_template_path('rails_app_generator', 'templates/addons/%<addon>')
      end

      private

      def gem_template_path(gem_name, template_path)
        gem_path = gem_path(gem_name)

        File.join(gem_path, template_path)
      end

      def gem_path(gem_name)
        gem = Gem.loaded_specs[gem_name]
        return gem.full_gem_path if gem

        puts "gem not available for '#{gem_name}'"

        return Dir.pwd if Dir.pwd.end_with?('dev/kgems/rails_app_generator') # code smell: this is for my local development environment

        raise "'#{gem_name}' not available"
      end
    end

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

    def create_root_files
      super

      add_if(:irbrc)
      add_if(:foreman)
      add_if(:dotenv)
      add_if(:docker)
      add_if(:docker_compose)
      add_if(:rubocop)
    end

    def create_test_files
      return if options[:skip_test]

      super if options[:test] == 'minitest'

      # puts options[:testing_framework]

      # add(:rspec) if options[:testing_framework] == 'rspec'
    end

    def finish_template
      puts 'finish template'

      add_if(:annotate)
      add_if(:continuous_integration)
      add_if(:high_voltage)
      add_if(:generators)
      add_if(:lograge)
      add_if(:pundit)
      add_if(:services)
      add_if(:sidekiq)
      add(:views, :errors, :scaffold) if options[:add_views]
      add_if(:factory_bot)
      add_if(:shoulda)

      # invoke :rails_customization
      super
    end
    no_commands do
      def source_paths
        [
          context.rails_override_template_path,
          context.rails_template_path
        ]
      end

      # Context wraps the configured options and can be made available to addons
      def context
        @context ||= Context.new(
          self.class.rails_template_path,
          self.class.override_template_path,
          self.class.addon_template_path,
          options
        )
      end

      def add(*addons)
        addons.each do |addon|
          addon = addon.to_s.capitalize.camelize
          addon = "RailsAppGenerator::AddOns::#{addon}"

          addon.constantize.apply(context)
        end
      end

      def add_if(addon)
        option_name = "add_#{addon}".to_sym
        add(addon) if options[option_name]
      end

      def uses?(addon)
        return false if options["skip_#{addon}".to_sym]

        addon = AddOn.get(addon)
        Dependencies.new(addon, context).satisfied?
      end
    end
  end
end
