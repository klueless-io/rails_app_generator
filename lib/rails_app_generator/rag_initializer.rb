# frozen_string_literal: true

# frozen__tring_literal: true

KConfig.configure do |config|
  rag = config.rag
  # https://railsbytes.com/public/templates
  # http://www.railscomposer.com/
  # https://github.com/RailsApps/rails-composer
  # https://github.com/carbonfive/raygun-rails
  # https://github.com/abhaynikam/boring_generators

  # rag.add_option :test                        , type: :string , default: 'rspec'

  # rag.add_option :skip_namespace                , type: :boolean    , default: false         , description: "Skip namespace (affects only isolated engines)"
  # rag.add_option :skip_collision_check          , type: :boolean    , default: false         , description: "Skip collision check"
  rag.add_option :force , type: :boolean , default: nil , description: 'Overwrite files that already exist'
  # XXX rag.add_option :pretend                       , type: :boolean    , default: nil           , description: "Run but do not make any changes"
  # XXX rag.add_option :quiet                         , type: :boolean    , default: nil           , description: "Suppress status output"
  # XXX rag.add_option :skip                          , type: :boolean    , default: nil           , description: "Skip files that already exist"
  # rag.add_option :ruby                           , type: :string     , default: "/Users/davidcruwys/.asdf/installs/ruby/2.7.6/bin/ruby"         , description: "Path to the Ruby binary of your choice"
  # XXX rag.add_option :template                      , type: :string     , default: nil           , description: "Path to some application template (can be a filesystem path or URL)"
  # rag.add_option :database                      , type: :string     , default: "sqlite3"     , description: "Preconfigure for selected database (options: mysql/postgresql/sqlite3/oracle/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)"
  # rag.add_option :skip_git                      , type: :boolean    , default: false         , description: "Skip .gitignore file"
  # rag.add_option :skip_keeps                    , type: :boolean    , default: false         , description: "Skip source control .keep files"
  # rag.add_option :skip_action_mailer            , type: :boolean    , default: false         , description: "Skip Action Mailer files"
  # rag.add_option :skip_action_mailbox           , type: :boolean    , default: false         , description: "Skip Action Mailbox gem"
  # rag.add_option :skip_action_text              , type: :boolean    , default: false         , description: "Skip Action Text gem"
  # rag.add_option :skip_active_record            , type: :boolean    , default: false         , description: "Skip Active Record files"
  # rag.add_option :skip_active_job               , type: :boolean    , default: false         , description: "Skip Active Job"
  # rag.add_option :skip_active_storage           , type: :boolean    , default: false         , description: "Skip Active Storage files"
  # rag.add_option :skip_action_cable             , type: :boolean    , default: false         , description: "Skip Action Cable files"
  # rag.add_option :skip_asset_pipeline           , type: :boolean    , default: false         , description: "Indicates when to generate skip asset pipeline"
  # rag.add_option :asset_pipeline                , type: :string     , default: "sprockets"         , description: "Choose your asset pipeline [options: sprockets (default), propshaft]"
  # rag.add_option :skip_javascript               , type: :boolean    , default: false         , description: "Skip JavaScript files"
  # rag.add_option :skip_hotwire                  , type: :boolean    , default: false         , description: "Skip Hotwire integration"
  # rag.add_option :skip_jbuilder                 , type: :boolean    , default: false         , description: "Skip jbuilder gem"
  # rag.add_option :skip_test                     , type: :boolean    , default: false         , description: "Skip test files"
  # rag.add_option :skip_system_test              , type: :boolean    , default: false         , description: "Skip system test files"
  # rag.add_option :skip_bootsnap                 , type: :boolean    , default: false         , description: "Skip bootsnap gem"
  # rag.add_option :dev                           , type: :boolean    , default: false         , description: "Set up the application with Gemfile pointing to your Rails checkout"
  # rag.add_option :edge                          , type: :boolean    , default: false         , description: "Set up the application with Gemfile pointing to Rails repository"
  rag.add_option :note                          , type: :string    , default: nil         , description: "Set a note or comment"
  # rag.add_option :main                          , type: :boolean    , default: false         , description: "Set up the application with Gemfile pointing to Rails repository main branch"
  # rag.add_option :rc                            , type: :string     , default: nil            , description: "Path to file containing extra configuration options for rails command"
  # rag.add_option :no_rc                         , type: :boolean    , default: false         , description: "Skip loading of extra configuration options from .railsrc file"
  # rag.add_option :help                          , type: :boolean    , default: nil            , description: "Show this help message and quit"
  # rag.add_option :version                       , type: :boolean    , default: nil            , description: "Show Rails version number and quit"
  # rag.add_option :api                           , type: :boolean    , default: false         , description: "Preconfigure smaller stack for API only apps"
  # rag.add_option :minimal                       , type: :boolean    , default: nil            , description: "Preconfigure a minimal rails app"
  # rag.add_option :javascript                    , type: :string     , default: "importmap"         , description: "Choose JavaScript approach [options: importmap (default), webpack, esbuild, rollup]"
  # rag.add_option :css                           , type: :string     , default: nil            , description: "Choose CSS processor [options: tailwind, bootstrap, bulma, postcss, sass... check https://github.com/rails/cssbundling-rails]"
  # rag.add_option :skip_bundle                   , type: :boolean    , default: false         , description: "Don't run bundle install"

  # future_option   :database                   , type: :string , default: 'sqlite3'          # , description: "Preconfigure for selected database (options: #{DATABASES.join('/')})"
  # rag.add_option    :skip_git                   , type: :boolean, default: false              # , description: "Skip .gitignore file"
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
  # rag.add_option    :skip_test                  , type: :boolean, default: false              # , description: "Skip test files"
  rag.add_option    :test                       , type: :string , default: 'rspec'            # , description: "minitest or rspec (default: rspec)"
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
  # rag.add_option    :css                        , type: :string                               , description: "Choose CSS processor [options: tailwind, bootstrap, bulma, postcss, sass... check https://github.com/rails/cssbundling-rails]"
  # rag.add_option    :skip_bundle                , type: :boolean, default: false              , description: "Don't run bundle install"

  # rag.add_option :add_irbrc                   , type: :boolean, default: false
  # rag.add_option :add_foreman                 , type: :boolean, default: false
  # rag.add_option :add_docker                  , type: :boolean, default: false
  # rag.add_option :add_docker_compose          , type: :boolean, default: false
  # rag.add_option :add_continuous_integration  , type: :boolean, default: false
  # rag.add_option :add_high_voltage            , type: :boolean, default: false
  # rag.add_option :add_generators              , type: :boolean, default: false
  # rag.add_option :add_pundit                  , type: :boolean, default: false # cancancan vs action_policy vs pundit
  # rag.add_option :add_services                , type: :boolean, default: false
  # rag.add_option :add_sidekiq                 , type: :boolean, default: false
  # rag.add_option :add_views                   , type: :boolean, default: false
  # rag.add_option :add_errors                  , type: :boolean, default: false
  # rag.add_option :add_scaffold                , type: :boolean, default: false
  # rag.add_option :add_factory_bot             , type: :boolean, default: false
  # rag.add_option :add_shoulda                 , type: :boolean, default: false
  # letter_opener

  # NEW GEM ADDONS
  rag.add_option :add_acts_as_list            , type: :boolean, default: false
  rag.add_option :add_administrate            , type: :boolean, default: false
  rag.add_option :add_annotate                , type: :boolean, default: false
  rag.add_option :add_avo                     , type: :boolean, default: false
  rag.add_option :add_bcrypt                  , type: :boolean, default: false
  rag.add_option :add_browser                 , type: :boolean, default: false
  rag.add_option :add_chartkick               , type: :boolean, default: false
  # continuous_integration
  rag.add_option :add_devise                  , type: :boolean, default: false
  rag.add_option :add_devise_masquerade       , type: :boolean, default: false
  # docker_compose
  # docker
  rag.add_option :add_dotenv                  , type: :boolean, default: false
  # factory_bot
  rag.add_option :add_faker                   , type: :boolean, default: false
  # generators
  rag.add_option :add_groupdate               , type: :boolean, default: false
  rag.add_option :add_hexapdf                 , type: :boolean, default: false
  rag.add_option :add_httparty                , type: :boolean, default: false
  # high_voltage
  rag.add_option :add_honeybadger             , type: :boolean, default: false
  rag.add_option :add_lograge                 , type: :boolean, default: false
  rag.add_option :add_minimal_css             , type: :boolean, default: false
  rag.add_option :minimal_css_library         , type: :string, default: 'water.css', description: "Minimal CSS library to get you started. [options: water.css (default)]"
  rag.add_option :add_mini_magick             , type: :boolean, default: false
  rag.add_option :add_motor_admin             , type: :boolean, default: false
  rag.add_option :add_public_suffix           , type: :boolean, default: false
  rag.add_option :add_phony_rails             , type: :boolean, default: false
  # pundit
  rag.add_option :add_rails_html_sanitizer    , type: :boolean, default: false
  # rails_app_generator
  # RANSACK
  rag.add_option :add_redcarpet               , type: :boolean, default: false
  # services
  # shoulda
  # sidekiq
  rag.add_option :add_rubocop                 , type: :boolean, default: false
  rag.add_option :add_twilio_ruby             , type: :boolean, default: false
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
