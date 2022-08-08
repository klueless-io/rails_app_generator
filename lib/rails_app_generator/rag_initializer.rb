# frozen_string_literal: true

# frozen__tring_literal: true

KConfig.configure do |config|
  # https://railsbytes.com/public/templates
  # http://www.railscomposer.com/
  # https://github.com/RailsApps/rails-composer
  # https://github.com/carbonfive/raygun-rails
  # https://github.com/abhaynikam/boring_generators

  # config.rag.add_option :test                        , type: :string , default: 'rspec'

  # # Gem                              Current  Latest   Requested  Groups
  # # aws-sdk
  # # capistrano-bundler               1.6.0    2.1.0    ~> 1.2     development, test
  # # capybara                         3.33.0   3.37.1   = 3.33.0   development, test
  # # clamby                           1.6.6    1.6.8    = 1.6.6    default
  # # createsend                       5.1.1    6.0.0    ~> 5.1     default
  # # database_cleaner                 1.7.0    2.0.1    = 1.7.0    development, test
  # # erubi                            1.10.0   1.11.0
  # # factory_bot                      5.2.0    6.2.1
  # # factory_bot_rails                5.2.0    6.2.0    = 5.2.0    development, test
  # # guard-bundler                    2.2.1    3.0.0    = 2.2.1    development, test
  # # guard-rubocop                    1.4.0    1.5.0    = 1.4.0    development, test
  # # http-accept                      1.7.0    2.2.0
  # # net-ssh                          6.1.0    7.0.1
  # # oauth2                           1.4.10   2.0.6
  # # omniauth-oauth2                  1.7.3    1.8.0
  # # paper_trail                      10.3.1   12.3.0   ~> 10.3    default
  # # pg                               0.21.0   1.4.2    ~> 0.20    default
  # # pg_search                        2.3.0    2.3.6    ~> 2.0     default
  # # pry                              0.13.1   0.14.1
  # # public_suffix                    2.0.5    5.0.0    ~> 2.0     default
  # # pusher                           1.4.3    2.0.2    ~> 1.3     default
  # # rack-mini-profiler               0.10.7   3.0.0    ~> 0.10    default
  # # rack-test                        0.6.3    2.0.2
  # # rails                            5.0.7.2  7.0.3.1  = 5.0.7.2  default
  # # railties                         5.0.7.2  7.0.3.1
  # # ransack                          1.8.10   3.2.1    ~> 1.8     default
  # # redis                            3.3.5    4.7.1    ~> 3.3     default
  # # redis-store                      1.6.0    1.9.1
  # # regexp_parser                    1.8.2    2.5.0
  # # rspec                            3.10.0   3.11.0
  # # rspec-core                       3.10.1   3.11.0   = 3.10.1   development, test
  # # rspec-expectations               3.10.1   3.11.0   = 3.10.1   development, test
  # # rspec-mocks                      3.10.2   3.11.1   = 3.10.2   development, test
  # # rspec-rails                      4.1.2    5.1.2    = 4.1.2    development, test
  # # rspec-support                    3.10.2   3.11.0   = 3.10.2   development, test
  # # rubyzip                          1.3.0    2.3.2    ~> 1.3     default
  # # scenic                           1.5.4    1.6.0    = 1.5.4    default
  # # scout_apm                        4.1.2    5.2.0    ~> 4.1     default
  # # selenium-webdriver               3.142.7  4.3.0    = 3.142.7  development, test
  # # shoulda-matchers                 4.0.1    5.1.0    = 4.0.1    development, test
  # # sidekiq                          4.2.10   6.5.1    ~> 4.2     default
  # # sidekiq-pool                     1.9.3    2.0.1    ~> 1.8     default
  # # sidekiq-unique-jobs              6.0.25   7.1.27   ~> 6.0     default
  # # spring                           2.1.1    4.0.0    ~> 2.0     development, test
  # # sprockets                        3.7.2    4.1.1    ~> 3.7     default
  # # sprockets-rails                  3.2.2    3.4.2
  # # timecop                          0.8.1    0.9.5    = 0.8.1    development, test
  # # tzinfo                           1.2.10   2.0.5
  # # uglifier                         3.2.0    4.2.0    ~> 3.2     default
  # # unicorn                          5.8.0    6.1.0    ~> 5.3     default
  # # webmock                          3.13.0   3.16.0   = 3.13.0   development, test
  # # websocket-driver                 0.6.5    0.7.5

  # # acts_as_list         0.9.19   1.0.4    ~> 0.9     default
  # # arel                 7.1.4    9.0.0
  # # bigdecimal           1.4.4    3.1.2    ~> 1.4     development, test
  # # binding_of_caller    0.8.0    1.0.0    ~> 0.8     default
  # # browser              2.7.1    5.3.1    ~> 2.3     default
  # # capistrano-bundler   1.6.0    2.1.0    ~> 1.2     development, test
  # # capybara             3.33.0   3.37.1   = 3.33.0   development, test
  # # chartkick            2.3.5    4.2.0    ~> 2.3     default
  # # childprocess         3.0.0    4.1.0
  # # clamby               1.6.6    1.6.8    = 1.6.6    default
  # # createsend           5.1.1    6.0.0    ~> 5.1     default
  # # database_cleaner     1.7.0    2.0.1    = 1.7.0    development, test
  # # factory_bot          5.2.0    6.2.1
  # # factory_bot_rails    5.2.0    6.2.0    = 5.2.0    development, test
  # # faker                1.9.6    2.22.0   ~> 1.7     default
  # # groupdate            4.3.0    6.1.0    ~> 4.1     default
  # # guard-bundler        2.2.1    3.0.0    = 2.2.1    development, test
  # # guard-rubocop        1.4.0    1.5.0    = 1.4.0    development, test
  # # hashie               3.6.0    5.0.0
  # # http-accept          1.7.0    2.1.1
  # # k_log                0.0.18   0.0.33   = 0.0.18   development, test
  # # net-ssh              6.1.0    7.0.1
  # # oauth2               1.4.10   2.0.6
  # # omniauth-oauth2      1.7.3    1.8.0
  # # paper_trail          10.3.1   12.3.0   ~> 10.3    default
  # # pg                   0.21.0   1.4.2    ~> 0.20    default
  # # pg_search            2.3.0    2.3.6    ~> 2.0     default
  # # pry                  0.13.1   0.14.1
  # # public_suffix        2.0.5    5.0.0    ~> 2.0     default
  # # pusher               1.4.3    2.0.2    ~> 1.3     default
  # # rack-mini-profiler   0.10.7   3.0.0    ~> 0.10    default
  # # rack-test            0.6.3    2.0.2
  # # rails                5.0.7.2  7.0.3.1  = 5.0.7.2  default
  # # railties             5.0.7.2  7.0.3.1
  # # ransack              1.8.10   3.2.1    ~> 1.8     default
  # # redis                3.3.5    4.7.1    ~> 3.3     default
  # # redis-store          1.6.0    1.9.1
  # # regexp_parser        1.8.2    2.5.0
  # # rspec                3.10.0   3.11.0
  # # rspec-core           3.10.1   3.11.0   = 3.10.1   development, test
  # # rspec-expectations   3.10.1   3.11.0   = 3.10.1   development, test
  # # rspec-mocks          3.10.2   3.11.1   = 3.10.2   development, test
  # # rspec-rails          4.1.2    5.1.2    = 4.1.2    development, test
  # # rspec-support        3.10.2   3.11.0   = 3.10.2   development, test
  # # rubyzip              1.3.0    2.3.2    ~> 1.3     default
  # # scenic               1.5.4    1.6.0    = 1.5.4    default
  # # scout_apm            4.1.2    5.2.0    ~> 4.1     default
  # # selenium-webdriver   3.142.7  4.3.0    = 3.142.7  development, test
  # # shoulda-matchers     4.0.1    5.1.0    = 4.0.1    development, test
  # # sidekiq              4.2.10   6.5.1    ~> 4.2     default
  # # sidekiq-pool         1.9.3    2.0.1    ~> 1.8     default
  # # sidekiq-unique-jobs  6.0.25   7.1.27   ~> 6.0     default
  # # spring               2.1.1    4.0.0    ~> 2.0     development, test
  # # sprockets            3.7.2    4.1.1    ~> 3.7     default
  # # sprockets-rails      3.2.2    3.4.2
  # # timecop              0.8.1    0.9.5    = 0.8.1    development, test
  # # tzinfo               1.2.10   2.0.5
  # # uglifier             3.2.0    4.2.0    ~> 3.2     default
  # # unicorn              5.8.0    6.1.0    ~> 5.3     default
  # # webmock              3.13.0   3.14.0   = 3.13.0   development, test
  # # websocket-driver     0.6.5    0.7.5


  # config.rag.add_option :skip_namespace                , type: :boolean    , default: false         , description: "Skip namespace (affects only isolated engines)"
  # config.rag.add_option :skip_collision_check          , type: :boolean    , default: false         , description: "Skip collision check"
  config.rag.add_option :force                         , type: :boolean    , default: nil           , description: "Overwrite files that already exist"
  # XXX config.rag.add_option :pretend                       , type: :boolean    , default: nil           , description: "Run but do not make any changes"
  # XXX config.rag.add_option :quiet                         , type: :boolean    , default: nil           , description: "Suppress status output"
  # XXX config.rag.add_option :skip                          , type: :boolean    , default: nil           , description: "Skip files that already exist"
  # config.rag.add_option :ruby                           , type: :string     , default: "/Users/davidcruwys/.asdf/installs/ruby/2.7.6/bin/ruby"         , description: "Path to the Ruby binary of your choice"
  # XXX config.rag.add_option :template                      , type: :string     , default: nil           , description: "Path to some application template (can be a filesystem path or URL)"
  # config.rag.add_option :database                      , type: :string     , default: "sqlite3"     , description: "Preconfigure for selected database (options: mysql/postgresql/sqlite3/oracle/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)"
  # config.rag.add_option :skip_git                      , type: :boolean    , default: false         , description: "Skip .gitignore file"
  # config.rag.add_option :skip_keeps                    , type: :boolean    , default: false         , description: "Skip source control .keep files"
  # config.rag.add_option :skip_action_mailer            , type: :boolean    , default: false         , description: "Skip Action Mailer files"
  # config.rag.add_option :skip_action_mailbox           , type: :boolean    , default: false         , description: "Skip Action Mailbox gem"
  # config.rag.add_option :skip_action_text              , type: :boolean    , default: false         , description: "Skip Action Text gem"
  # config.rag.add_option :skip_active_record            , type: :boolean    , default: false         , description: "Skip Active Record files"
  # config.rag.add_option :skip_active_job               , type: :boolean    , default: false         , description: "Skip Active Job"
  # config.rag.add_option :skip_active_storage           , type: :boolean    , default: false         , description: "Skip Active Storage files"
  # config.rag.add_option :skip_action_cable             , type: :boolean    , default: false         , description: "Skip Action Cable files"
  # config.rag.add_option :skip_asset_pipeline           , type: :boolean    , default: false         , description: "Indicates when to generate skip asset pipeline"
  # config.rag.add_option :asset_pipeline                , type: :string     , default: "sprockets"         , description: "Choose your asset pipeline [options: sprockets (default), propshaft]"
  # config.rag.add_option :skip_javascript               , type: :boolean    , default: false         , description: "Skip JavaScript files"
  # config.rag.add_option :skip_hotwire                  , type: :boolean    , default: false         , description: "Skip Hotwire integration"
  # config.rag.add_option :skip_jbuilder                 , type: :boolean    , default: false         , description: "Skip jbuilder gem"
  # config.rag.add_option :skip_test                     , type: :boolean    , default: false         , description: "Skip test files"
  # config.rag.add_option :skip_system_test              , type: :boolean    , default: false         , description: "Skip system test files"
  # config.rag.add_option :skip_bootsnap                 , type: :boolean    , default: false         , description: "Skip bootsnap gem"
  # config.rag.add_option :dev                           , type: :boolean    , default: false         , description: "Set up the application with Gemfile pointing to your Rails checkout"
  # config.rag.add_option :edge                          , type: :boolean    , default: false         , description: "Set up the application with Gemfile pointing to Rails repository"
  # config.rag.add_option :main                          , type: :boolean    , default: false         , description: "Set up the application with Gemfile pointing to Rails repository main branch"
  # config.rag.add_option :rc                            , type: :string     , default: nil            , description: "Path to file containing extra configuration options for rails command"
  # config.rag.add_option :no_rc                         , type: :boolean    , default: false         , description: "Skip loading of extra configuration options from .railsrc file"
  # config.rag.add_option :help                          , type: :boolean    , default: nil            , description: "Show this help message and quit"
  # config.rag.add_option :version                       , type: :boolean    , default: nil            , description: "Show Rails version number and quit"
  # config.rag.add_option :api                           , type: :boolean    , default: false         , description: "Preconfigure smaller stack for API only apps"
  # config.rag.add_option :minimal                       , type: :boolean    , default: nil            , description: "Preconfigure a minimal rails app"
  # config.rag.add_option :javascript                    , type: :string     , default: "importmap"         , description: "Choose JavaScript approach [options: importmap (default), webpack, esbuild, rollup]"
  # config.rag.add_option :css                           , type: :string     , default: nil            , description: "Choose CSS processor [options: tailwind, bootstrap, bulma, postcss, sass... check https://github.com/rails/cssbundling-rails]"
  # config.rag.add_option :skip_bundle                   , type: :boolean    , default: false         , description: "Don't run bundle install"

  # future_option   :database                   , type: :string , default: 'sqlite3'          # , description: "Preconfigure for selected database (options: #{DATABASES.join('/')})"
  # config.rag.add_option    :skip_git                   , type: :boolean, default: false              # , description: "Skip .gitignore file"
  # future_option   :skip_keeps                 , type: :boolean, default: false              # , description: "Skip source control .keep files"
  # future_option   :skip_action_mailer         , type: :boolean, default: false              # , description: "Skip Action Mailer files"
  # future_option   :skip_action_mailbox        , type: :boolean, default: false              # , description: "Skip Action Mailbox gem"
  # future_option   :skip_action_text           , type: :boolean, default: false              # , description: "Skip Action Text gem"
  # future_option   :skip_active_record         , type: :boolean, default: false              # , description: "Skip Active Record files"
  # future_option   :skip_active_job            , type: :boolean, default: false              # , description: "Skip Active Job"
  # future_option   :skip_active_storage        , type: :boolean, default: false              # , description: "Skip Active Storage files"
  # future_option   :skip_action_cable          , type: :boolean, default: false              # , description: "Skip Action Cable files"
  # future_option   :skip_asset_pipeline        , type: :boolean, default: false              #
  # future_option   :asset_pipeline             , type: :string , default: 'sprockets'        # , description: "Choose your asset pipeline [options: sprockets (default), propshaft]"
  # future_option   :skip_javascript            , type: :boolean, default: false # name == 'plugin'   # , description: "Skip JavaScript files"
  # future_option   :skip_hotwire               , type: :boolean, default: false              # , description: "Skip Hotwire integration"
  # future_option   :skip_jbuilder              , type: :boolean, default: false              # , description: "Skip jbuilder gem"
  # config.rag.add_option    :skip_test                  , type: :boolean, default: false              # , description: "Skip test files"
  # config.rag.add_option    :test                       , type: :string , default: 'rspec'            # , description: "minitest or rspec (default: rspec)"
  # future_option   :skip_system_test           , type: :boolean, default: false              # , description: "Skip system test files"
  # future_option   :skip_bootsnap              , type: :boolean, default: false              # , description: "Skip bootsnap gem"
  # future_option   :dev                        , type: :boolean, default: false              # , description: "Set up the #{name} with Gemfile pointing to your Rails checkout"
  # future_option   :edge                       , type: :boolean, default: false              # , description: "Set up the #{name} with Gemfile pointing to Rails repository"
  # future_option   :main                       , type: :boolean, default: false              # , description: "Set up the #{name} with Gemfile pointing to Rails repository main branch"
  # future_option   :rc                         , type: :string , default: nil                # , description: "Path to file containing extra configuration options for rails command"
  # future_option   :no_rc                      , type: :boolean, default: false              # , description: "Skip loading of extra configuration options from .railsrc file"
  # future_option   :help                       , type: :boolean                              # , group: :rails               # , description: "Show this help message and quit"
  # future_option   :version                    , type: :boolean                              # , group: :rails, description: "Show Rails version number and quit"
  # future_option   :api                        , type: :boolean                              # , description: "Preconfigure smaller stack for API only apps"
  # future_option   :minimal                    , type: :boolean                              # , description: "Preconfigure a minimal rails app"
  # future_option   :javascript                 , type: :string , default: 'importmap'        # , description: "Choose JavaScript approach [options: importmap (default), webpack, esbuild, rollup]"
  # config.rag.add_option    :css                        , type: :string                               , description: "Choose CSS processor [options: tailwind, bootstrap, bulma, postcss, sass... check https://github.com/rails/cssbundling-rails]"
  # config.rag.add_option    :skip_bundle                , type: :boolean, default: false              , description: "Don't run bundle install"

  # config.rag.add_option :add_irbrc                   , type: :boolean, default: false
  # config.rag.add_option :add_foreman                 , type: :boolean, default: false
  # config.rag.add_option :add_devise                  , type: :boolean, default: false
  # config.rag.add_option :add_dotenv                  , type: :boolean, default: false
  # config.rag.add_option :add_docker                  , type: :boolean, default: false
  # config.rag.add_option :add_docker_compose          , type: :boolean, default: false
  # config.rag.add_option :add_rubocop                 , type: :boolean, default: false
  # config.rag.add_option :add_annotate                , type: :boolean, default: false
  # config.rag.add_option :add_continuous_integration  , type: :boolean, default: false
  # config.rag.add_option :add_high_voltage            , type: :boolean, default: false
  # config.rag.add_option :add_generators              , type: :boolean, default: false
  # config.rag.add_option :add_lograge                 , type: :boolean, default: false
  # config.rag.add_option :add_pundit                  , type: :boolean, default: false
  # config.rag.add_option :add_services                , type: :boolean, default: false
  # config.rag.add_option :add_sidekiq                 , type: :boolean, default: false
  # config.rag.add_option :add_views                   , type: :boolean, default: false
  # config.rag.add_option :add_errors                  , type: :boolean, default: false
  # config.rag.add_option :add_scaffold                , type: :boolean, default: false
  # config.rag.add_option :add_factory_bot             , type: :boolean, default: false
  # config.rag.add_option :add_shoulda                 , type: :boolean, default: false

  # NEW GEM ADDONS
  config.rag.add_option :add_acts_as_list             , type: :boolean, default: false
  config.rag.add_option :add_browser                  , type: :boolean, default: false
  config.rag.add_option :add_chartkick                , type: :boolean, default: false
  config.rag.add_option :add_faker                    , type: :boolean, default: false
  config.rag.add_option :add_groupdate                , type: :boolean, default: false
  config.rag.add_option :add_hexapdf                  , type: :boolean, default: false
  config.rag.add_option :add_httparty                 , type: :boolean, default: false
  config.rag.add_option :add_honeybadger              , type: :boolean, default: false
  config.rag.add_option :add_mini_magick              , type: :boolean, default: false , description: "Add Mini Magick gem"
  config.rag.add_option :add_rails_html_sanitizer     , type: :boolean, default: false
  config.rag.add_option :add_twilio_ruby              , type: :boolean, default: false
end

# Make sure that RailsOptions reflect the options available from Railties
RailsAppGenerator::AppGenerator.class_options.each do |class_option|
  thor_option = class_option[1]
  # puts "Adding railties class_option onto RailsOptions: #{thor_option.name}"
  RailsAppGenerator::RailsOptions.add_thor_class_option(thor_option)
end
# Make sure that RailsOptions reflect the options available from custom configuration
KConfig.configuration.rag.options.each do |option|
  RailsAppGenerator::RailsOptions.add_class_option(option)
  RailsAppGenerator::AppGenerator.add_class_option(option)
end

# Debugging code
RailsAppGenerator::Util.write_last_run('rails_options_class.json', RailsAppGenerator::RailsOptions.to_h)
RailsAppGenerator::Util.write_last_run('app_generator_class.json', RailsAppGenerator::AppGenerator.to_h)
