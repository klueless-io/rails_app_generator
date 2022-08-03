# frozen_string_literal: true

# require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  AppGenerator is a wrapper for Rails::AppGenerator
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :test                        , type: :string , default: 'rspec'

    # acts_as_list         0.9.19   1.0.4    ~> 0.9     default
    # arel                 7.1.4    9.0.0
    # bigdecimal           1.4.4    3.1.2    ~> 1.4     development, test
    # binding_of_caller    0.8.0    1.0.0    ~> 0.8     default
    # browser              2.7.1    5.3.1    ~> 2.3     default
    # capistrano-bundler   1.6.0    2.1.0    ~> 1.2     development, test
    # capybara             3.33.0   3.37.1   = 3.33.0   development, test
    # chartkick            2.3.5    4.2.0    ~> 2.3     default
    # childprocess         3.0.0    4.1.0
    # clamby               1.6.6    1.6.8    = 1.6.6    default
    # createsend           5.1.1    6.0.0    ~> 5.1     default
    # database_cleaner     1.7.0    2.0.1    = 1.7.0    development, test
    # factory_bot          5.2.0    6.2.1
    # factory_bot_rails    5.2.0    6.2.0    = 5.2.0    development, test
    # faker                1.9.6    2.22.0   ~> 1.7     default
    # groupdate            4.3.0    6.1.0    ~> 4.1     default
    # guard-bundler        2.2.1    3.0.0    = 2.2.1    development, test
    # guard-rubocop        1.4.0    1.5.0    = 1.4.0    development, test
    # hashie               3.6.0    5.0.0
    # http-accept          1.7.0    2.1.1
    # k_log                0.0.18   0.0.33   = 0.0.18   development, test
    # net-ssh              6.1.0    7.0.1
    # oauth2               1.4.10   2.0.6
    # omniauth-oauth2      1.7.3    1.8.0
    # paper_trail          10.3.1   12.3.0   ~> 10.3    default
    # pg                   0.21.0   1.4.2    ~> 0.20    default
    # pg_search            2.3.0    2.3.6    ~> 2.0     default
    # pry                  0.13.1   0.14.1
    # public_suffix        2.0.5    5.0.0    ~> 2.0     default
    # pusher               1.4.3    2.0.2    ~> 1.3     default
    # rack-mini-profiler   0.10.7   3.0.0    ~> 0.10    default
    # rack-test            0.6.3    2.0.2
    # rails                5.0.7.2  7.0.3.1  = 5.0.7.2  default
    # railties             5.0.7.2  7.0.3.1
    # ransack              1.8.10   3.2.1    ~> 1.8     default
    # redis                3.3.5    4.7.1    ~> 3.3     default
    # redis-store          1.6.0    1.9.1
    # regexp_parser        1.8.2    2.5.0
    # rspec                3.10.0   3.11.0
    # rspec-core           3.10.1   3.11.0   = 3.10.1   development, test
    # rspec-expectations   3.10.1   3.11.0   = 3.10.1   development, test
    # rspec-mocks          3.10.2   3.11.1   = 3.10.2   development, test
    # rspec-rails          4.1.2    5.1.2    = 4.1.2    development, test
    # rspec-support        3.10.2   3.11.0   = 3.10.2   development, test
    # rubyzip              1.3.0    2.3.2    ~> 1.3     default
    # scenic               1.5.4    1.6.0    = 1.5.4    default
    # scout_apm            4.1.2    5.2.0    ~> 4.1     default
    # selenium-webdriver   3.142.7  4.3.0    = 3.142.7  development, test
    # shoulda-matchers     4.0.1    5.1.0    = 4.0.1    development, test
    # sidekiq              4.2.10   6.5.1    ~> 4.2     default
    # sidekiq-pool         1.9.3    2.0.1    ~> 1.8     default
    # sidekiq-unique-jobs  6.0.25   7.1.27   ~> 6.0     default
    # spring               2.1.1    4.0.0    ~> 2.0     development, test
    # sprockets            3.7.2    4.1.1    ~> 3.7     default
    # sprockets-rails      3.2.2    3.4.2
    # timecop              0.8.1    0.9.5    = 0.8.1    development, test
    # tzinfo               1.2.10   2.0.5
    # uglifier             3.2.0    4.2.0    ~> 3.2     default
    # unicorn              5.8.0    6.1.0    ~> 5.3     default
    # webmock              3.13.0   3.14.0   = 3.13.0   development, test
    # websocket-driver     0.6.5    0.7.5

    # gem "honeybadger", "4.6.0"
    # gem "pg", "0.20.0"
    # gem "redis", "3.3.3"
    # gem "redis-namespace", "1.5.3"
    # gem "redis-rails", "5.0.2"
    # gem "devise", "4.7.1"
    # gem "twilio-ruby", "5.23.0"
    # gem "google-api-client", "0.9"
    # gem "sinatra", "1.4.8", require: nil # used for the /sidekiq admin screen
    # gem "sidekiq", "4.2.10"
    # gem "sidekiq-unique-jobs", "6.0.25"
    # gem "sidekiq-pool", "1.8.1"
    # gem "faker", "1.7.3"
    # gem "clearbit", "0.2.8"
    # gem "groupdate", "4.1.2"
    # gem "acts_as_commentable", "4.0.2"
    # gem "acts_as_list", "0.9.5"
    # gem "kaminari", "1.2.1"
    # gem "chartkick", "4.1.2"
    # gem "jbuilder", "2.6.3"
    # gem "rest-client", "2.0.1"
    # gem "json", "2.3.0"
    # gem "httparty", "0.14.0"
    # gem "mini_magick", "4.9.4"
    # gem "skeptick", "0.2.1"
    # gem "aws-sdk", "3.0.2"
    # gem "phony_rails", "0.14.11"
    # gem "pg_search", "2.0.1"
    # gem "omniauth", "1.8.1", group: %i[development staging production worker]
    # gem "omniauth-google-oauth2", "0.3.0"
    # gem "redcarpet", "3.5.1"
    # gem "binding_of_caller", "0.8.0"
    # gem "bcrypt-ruby", "3.1.5"
    # gem "rb-readline", "0.5.5"
    # gem "has_secure_token", "1.0.0"
    # gem "stackprof", "0.2.10"
    # gem "createsend", "5.1.0"
    # gem "rubyzip", "1.3.0"
    # gem "chronic", "0.10.2"
    # gem "unread", "0.9.0"
    # gem "browser", "2.3.0"
    # gem "public_suffix", "2.0.5"
    # gem "sassc-rails", "2.1.0"
    # gem "bootstrap-sass", "3.4.1"
    # gem "sprockets", "3.7.2"
    # gem "uglifier", "3.2.0"
    # gem "jquery-rails", "4.1.1"
    # gem "remotipart", "1.3.1"
    # gem "rack-mini-profiler", "0.10.2", require: false
    # gem "flamegraph", "0.9.5"
    # gem "activerecord-import", "0.18.1"
    # gem "parallel", "1.11.1"
    # gem "ruby-progressbar", "1.8.1"
    # gem "css_parser", "1.5.0"
    # gem "guess", "0.1.1"
    # gem "fastimage", "2.1.0"
    # gem "thread", "0.2.2"
    # gem "parse-cron", "0.1.4"
    # gem "thread-parent", "1.0.4"
    # gem "hexapdf", "0.5.0"
    # gem "geocoder", "1.6.1"
    # gem "sd_notify", "0.1.1"
    # gem "attr_encrypted", "3.1.0"
    # gem "clamby", "1.6.6"
    # gem "scout_apm", "5.1.0"
    # gem "pusher", "1.3.0"
    # gem "phony", "2.18.18"
    # gem "recaptcha", "5.7.0"
    # gem "ransack", "1.8.10"
    # gem "configatron", "4.5.1"
    # gem "fuzzy-string-match", "1.0.1"
    # gem "jwt", "1.5.6"
    # gem "htmlentities", "4.3.4"
    # gem "scenic", "1.5.4"
    # gem "rack-cors", "1.0.6"
    # gem "rails_same_site_cookie", "0.1.8"
    # gem "paper_trail", "10.3.0"
    # gem "net-sftp", "3.0.0"
    # gem "prawn", "2.4.0"
    # gem "prawn-table", "0.2.2"
    # gem "appraisal"

    class_option :add_irbrc                   , type: :boolean, default: false
    class_option :add_foreman                 , type: :boolean, default: false
    class_option :add_devise                  , type: :boolean, default: false
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
    class_option :add_errors                  , type: :boolean, default: false
    class_option :add_scaffold                , type: :boolean, default: false
    class_option :add_factory_bot             , type: :boolean, default: false
    class_option :add_shoulda                 , type: :boolean, default: false

    # NEW GEM ADDONS
    class_option :add_rails_html_sanitizer    , type: :boolean, default: false
    class_option :add_honeybadger             , type: :boolean, default: false

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

    def initialize(*args)
      super

      @force_copy = false

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

    # def create_test_files
    #   return if options[:skip_test]

    #   super if options[:test] == 'minitest'

    #   # puts options[:testing_framework]

    #   # add(:rspec) if options[:testing_framework] == 'rspec'
    # end

    # rubocop:disable Metrics/AbcSize
    def finish_template
      puts 'finish template'

      add_if(:annotate)
      add_if(:devise)
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
      add_if(:rails_app_generator)
      add_if(:honeybadger)

      # invoke :rails_customization
      super
    end
    # rubocop:enable Metrics/AbcSize

    no_commands do
      # https://codingpackets.com/blog/rails-generators-cheat-sheet/

      # OLD style will be removed soon
      def local_template_base(xxx)
        File.join(File.dirname(xxx), File.basename(xxx, '.*'))
      end

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

      def db_migrate
        rails_command('db:migrate')
      end

      def db_seed
        rails_command('db:seed')
      end

      def add_stimulus(name, *args)
        generate(:stimulus, name, *args)
      end

      def bundle_add(name)
        run("bundle add #{name}")
      end

      def bundle_exec(name, *args)
        run("bundle exec #{name} #{args.join(' ')}")
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

      def copy_file(source, destination, **args)
        args = { force: true }.merge(args) if force_copy?

        super(source, destination, **args)
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

          addon.constantize.apply(context)
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

      def uses?(addon)
        return false unless active?(addon)

        addon = AddOn.get(addon)
        Dependencies.new(addon, context).satisfied?
      end

      def gems
        all_gemfile_entries = gemfile_entries + addon_gemfile_entries

        all_gemfile_entries.map do |entry|
          FormattedGemEntry.new(entry.name, entry.version, entry.comment, entry.options, entry.commented_out)
        end
      end

      def addon_classes
        AddOns.constants
              .map { |addon_klass_name| AddOns.const_get(addon_klass_name) }
              .select { |klass| klass.is_a?(Class) && klass.respond_to?(:addon_name) }
      end

      def active_addon_classes
        addon_classes.select { |klass| active?(klass.addon_name) }
      end

      def addon_gemfile_entries
        active_addon_classes.flat_map(&:gem_entries)
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
