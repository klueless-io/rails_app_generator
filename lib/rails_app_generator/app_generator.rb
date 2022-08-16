# frozen_string_literal: true

# require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  AppGenerator is a wrapper for Rails::AppGenerator
  class AppGenerator < Rails::Generators::AppGenerator
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
        @addon_template_path ||= gem_template_path('rails_app_generator', 'templates/addons/%<addon>s')
      end

      def add_class_option(option)
        find_name = option.name.to_s
        existing_option = class_options.find { |class_option| class_option[1].name == find_name }

        return if existing_option

        args = {
          type: option.type,
          default: option.default,
          required: option.required
        }

        # for some reason, Railties uses :desc while thor uses :description and thor has nice humanization when key is missing
        args[:desc] = option.description unless option.description

        class_option(option.name, **args)
      end

      def to_h
        thor_options = class_options.map { |o| o[1] }
        options_hash = RailsAppGenerator::Util.thor_options_to_hash(thor_options)

        # class_options_detailed: options_hash,
        {
          class_option_keys: options_hash.map { |option| option[:name] },
          class_options: options_hash.map { |option| option.slice(:name, :description, :type, :default, :required) }
        }
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

        # THIS CODE DOES NOT REALLY WORK
        return Dir.pwd if Dir.pwd.end_with?('dev/kgems/rails_app_generator') # code smell: this is for my local development environment

        raise "'#{gem_name}' not available"
      end
    end

    attr_reader :addon_instances

    def initialize(*args)
      super

      @force_copy = false
      @addon_instances = []

      # puts '----------------------------------------------------'
      # puts options
      # puts '----------------------------------------------------'

      # return unless options[:api]

      # self.options = options.merge(
      #   skip_errors: true,
      #   skip_high_voltage: true,
      #   skip_stimulus: true,
      #   skip_tailwind: true,
      #   skip_views: true
      # ).freeze
    end

    # def rails_customization
    #   puts 'rails customizations'
    #   # invoke :customize_gemfile
    #   # invoke :setup_development_environment
    #   # invoke :setup_production_environment
    #   # invoke :setup_secret_token
    #   # invoke :configure_app
    #   # invoke :copy_miscellaneous_files
    #   # invoke :setup_database
    #   # invoke :create_github_repo
    #   # invoke :generate_default
    #   # invoke :create_heroku_apps
    #   # invoke :generate_deployment_default
    #   # invoke :remove_config_comment_lines
    #   # invoke :remove_routes_comment_lines
    #   # invoke :outro
    # end

    # def xxx_generate_default
    #   puts 'xxx_generate_default'
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
      RailsAppGenerator::Util.write_last_run('app_generator_data.json', to_h)

      super

      add_if(:irbrc)
      add_if(:foreman)
      add_if(:dotenv)
      add_if(:docker)
      add_if(:docker_compose)
      add_if(:rubocop)
    end

    # def create_test_files
    #   return if options[:skip_test]

    #   super if options[:test] == 'minitest'

    #   # puts options[:testing_framework]

    #   # add(:rspec) if options[:testing_framework] == 'rspec'
    # end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def finish_template
      puts 'finish template'

      add_if(:acts_as_list) # tested
      add_if(:administrate) # tested
      add_if(:annotate) # tested
      add_if(:avo) # tested
      add_if(:bcrypt) # tested
      add_if(:browser) # tested
      add_if(:chartkick) # tested
      add_if(:continuous_integration) # TODO: needs work
      add_if(:devise) # tested
      # docker_compose
      # docker
      add_if(:dotenv) # tested
      add_if(:factory_bot) # TODO: needs testing
      add_if(:faker) # tested
      add_if(:generators) # TODO: needs testing
      add_if(:groupdate) # TODO: does not have a profile
      add_if(:hexapdf) # tested
      add_if(:httparty) # tested
      add_if(:high_voltage) # TODO: needs testing
      add_if(:honeybadger) # tested
      add_if(:lograge) # tested
      add_if(:mini_magick) # tested
      add_if(:motor_magick) # tested
      add_if(:public_suffix) # tested
      add_if(:phony_rails) # tested
      add_if(:pundit) # TODO: needs testing
      add_if(:rails_html_sanitizer) # tested
      add_if(:rails_app_generator) # TODO: needs testing
      add_if(:redcarpet) # tested
      add_if(:services) # TODO: needs testing
      add_if(:shoulda) # TODO: needs testing
      add_if(:sidekiq) # TODO: needs testing
      add_if(:rubocop) # tested
      add_if(:twilio_ruby) # tested
      add(:views, :errors, :scaffold) if active?(:views)

      # invoke :rails_customization
      super
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    # Fire any callbacks defined on addons either before running the custom template
    def apply_rails_template
      # currently running prepare_environment in the template
      # this is doing a bundle install
      # unfortunately this bundle install happens before the normal bundle install, but for now
      # I have to do it until I figure out the why I need the prepare_environment method anyway.
      addon_instances.select { |addon| addon.respond_to?(:before_template) }.each(&:before_template)
      super
    end

    # Fire any callbacks defined on addons either before or after the standard callbacks
    def run_after_bundle_callbacks
      addon_instances.select { |addon| addon.respond_to?(:before_bundle) }.each(&:before_bundle)
      super
      addon_instances.select { |addon| addon.respond_to?(:after_bundle) }.each(&:after_bundle)
    end

    no_commands do
      def to_h
        {
          options: options
        }
      end

      # https://codingpackets.com/blog/rails-generators-cheat-sheet/

      # force_copy?         # defaults to false
      # force_copy(true)    # set to true
      # force_copy(false)   # set to false
      # force_copy          # aka force_copy(true)
      def force_copy?
        @force_copy ||= options[:force_copy] || false
      end

      def force_copy(value: true)
        @force_copy = value
      end

      # USED BY AFTER_TEMPLATE
      def gac(message)
        return unless active?(:git)

        git add: '.'
        git commit: " -m '#{message}'"
      end

      def add_controller(name, *args)
        generate(:controller, name, *args)
      end

      def add_scaffold(name, *args)
        generate(:scaffold, name, *args)
      end

      def add_migration(name, *args)
        generate(:migration, name, *args)
      end

      def rubocop
        run('rubocop -A --config .rubocop.yml')
      end

      def db_migrate
        rails_command('db:migrate')
      end

      def db_seed
        rails_command('db:seed')
      end

      def add_stimulus(name, *args)
        generate(:stimulus, name, *args)
      end

      def prepare_environment
        bundle_add('pry')
        bundle_install
      end

      def bundle_install
        Util.bundler_environment(environment_style: :unbundled_env) do
          run('bundle install')
        end
      end

      def bundle_add(name)
        Util.bundler_environment(environment_style: :unbundled_env) do
          run("bundle add #{name}")
        end
      end

      def bundle_exec(name, *args)
        Util.bundler_environment(environment_style: :unbundled_env) do
          run("bundle exec #{name} #{args.join(' ')}")
        end
      end

      # If you need to manually install tailwind (instead of using the --template option)
      # you can use css_install('tailwind')
      def css_install(name)
        gem 'cssbundling-rails'
        rails_command("css:install:#{name}")
      end

      def pin(name, *args)
        run("bin/importmap pin #{name} #{args.join(' ')}")
      end

      def pin_download(name, *args)
        args << '--download' unless args.include?('--download')
        pin(name, *args)
      end

      # copy_file in railties and copy_file in thor have different signatures
      # I may want to remove this method because it just causes pain at the moment
      def copy_file(source, destination, args = {})
        # puts source
        # puts destination
        # puts args
        args = { force: true }.merge(args) if force_copy?

        super(source, destination, args)
      end

      def template(source, *args, &block)
        config = args.last.is_a?(Hash) ? args.pop : {}
        config[:force] = true if force_copy?
        args << config
        super(source, *args, &block)
      end

      def read_template(template_file)
        path = find_in_source_paths(template_file)

        File.read(path)
      end

      def join_templates(*template_files, join: "\n\n")
        template_files.map { |template_file| read_template(template_file) }.join(join)
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

      # Local template path is handy when you want template files used when working with the --template flag
      attr_accessor :local_template_path

      def source_paths
        paths = local_template_path ? [local_template_path] : []
        paths << context.rails_override_template_path
        paths << context.rails_template_path
        paths
      end

      # Context wraps the configured options and can be made available to addons
      # TODO: should I add local_template_path to the context?
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

          addon_instance = addon.constantize.new(context)

          if addon_instance.uses?
            addon_instance.apply
            @addon_instances << addon_instance
          end
        end
      end

      def add_if(addon)
        add(addon) if active?(addon)
      end

      # def skip_flag?(option_name)
      #   value = options["skip_#{option_name}".to_sym]

      #   return true if value.nil?

      #   value == true
      # end

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

      def uses?(addon)
        return false unless active?(addon)

        addon = AddonUtil.get(addon)
        Dependencies.new(addon, context).satisfied?
      end

      def gems
        all_gemfile_entries = gemfile_entries + addon_gemfile_entries

        all_gemfile_entries.map do |entry|
          FormattedGemEntry.new(entry.name, entry.version, entry.comment, entry.options, entry.commented_out)
        end
      end

      def active_addon_classes
        AddonUtil.classes.select { |klass| active?(klass.addon_name) }
      end

      def addon_gemfile_entries
        active_addon_classes.flat_map(&:gem_entries)
      end

      def capture_console(&block)
        Util.capture_console(&block)
      end
    end

    protected

    # rubocop:disable Naming/AccessorMethodName
    def get_builder_class
      RailsAppGenerator::AppBuilder
    end
    # rubocop:enable Naming/AccessorMethodName
  end
end
