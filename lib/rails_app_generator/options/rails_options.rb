# frozen_string_literal: true

module RailsAppGenerator
  class RailsOptions < OptionsBuilder
    # NOTE: Currently you need to register new options in two places
    #       here and in lib/rails_app_generator/app_generator.rb
    register_option :template                   , type: :string                               # , desc: "Path to some #{name} template (can be a filesystem path or URL)"
    future_option   :database                   , type: :string , default: 'sqlite3'          # , desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"
    register_option :skip_git                   , type: :boolean, default: false              # , desc: "Skip .gitignore file"
    future_option   :skip_keeps                 , type: :boolean, default: false              # , desc: "Skip source control .keep files"
    future_option   :skip_action_mailer         , type: :boolean, default: false              # , desc: "Skip Action Mailer files"
    future_option   :skip_action_mailbox        , type: :boolean, default: false              # , desc: "Skip Action Mailbox gem"
    future_option   :skip_action_text           , type: :boolean, default: false              # , desc: "Skip Action Text gem"
    future_option   :skip_active_record         , type: :boolean, default: false              # , desc: "Skip Active Record files"
    future_option   :skip_active_job            , type: :boolean, default: false              # , desc: "Skip Active Job"
    future_option   :skip_active_storage        , type: :boolean, default: false              # , desc: "Skip Active Storage files"
    future_option   :skip_action_cable          , type: :boolean, default: false              # , desc: "Skip Action Cable files"
    future_option   :skip_asset_pipeline        , type: :boolean, default: false              #
    future_option   :asset_pipeline             , type: :string , default: 'sprockets'        # , desc: "Choose your asset pipeline [options: sprockets (default), propshaft]"
    future_option   :skip_javascript            , type: :boolean, default: false # name == 'plugin'   # , desc: "Skip JavaScript files"
    future_option   :skip_hotwire               , type: :boolean, default: false              # , desc: "Skip Hotwire integration"
    future_option   :skip_jbuilder              , type: :boolean, default: false              # , desc: "Skip jbuilder gem"
    register_option :skip_test                  , type: :boolean, default: false              # , desc: "Skip test files"
    register_option :test                       , type: :string , default: 'rspec'            # , desc: "minitest or rspec (default: rspec)"
    future_option   :skip_system_test           , type: :boolean, default: false              # , desc: "Skip system test files"
    future_option   :skip_bootsnap              , type: :boolean, default: false              # , desc: "Skip bootsnap gem"
    future_option   :dev                        , type: :boolean, default: false              # , desc: "Set up the #{name} with Gemfile pointing to your Rails checkout"
    future_option   :edge                       , type: :boolean, default: false              # , desc: "Set up the #{name} with Gemfile pointing to Rails repository"
    future_option   :main                       , type: :boolean, default: false              # , desc: "Set up the #{name} with Gemfile pointing to Rails repository main branch"
    future_option   :rc                         , type: :string , default: nil                # , desc: "Path to file containing extra configuration options for rails command"
    future_option   :no_rc                      , type: :boolean, default: false              # , desc: "Skip loading of extra configuration options from .railsrc file"
    future_option   :help                       , type: :boolean                              # , group: :rails               # , desc: "Show this help message and quit"
    future_option   :version                    , type: :boolean                              # , group: :rails, desc: "Show Rails version number and quit"
    future_option   :api                        , type: :boolean                              # , desc: "Preconfigure smaller stack for API only apps"
    future_option   :minimal                    , type: :boolean                              # , desc: "Preconfigure a minimal rails app"
    future_option   :javascript                 , type: :string , default: 'importmap'        # , desc: "Choose JavaScript approach [options: importmap (default), webpack, esbuild, rollup]"
    register_option :css                        , type: :string                               # , desc: "Choose CSS processor [options: tailwind, bootstrap, bulma, postcss, sass... check https://github.com/rails/cssbundling-rails]"
    register_option :skip_bundle                , type: :boolean, default: false              # , desc: "Don't run bundle install"

    register_option :add_irbrc                  , type: :boolean, default: false
    register_option :add_foreman                , type: :boolean, default: false
    register_option :add_devise                 , type: :boolean, default: false
    register_option :add_dotenv                 , type: :boolean, default: false
    register_option :add_docker                 , type: :boolean, default: false
    register_option :add_docker_compose         , type: :boolean, default: false
    register_option :add_rubocop                , type: :boolean, default: false
    register_option :add_annotate               , type: :boolean, default: false
    register_option :add_continuous_integration , type: :boolean, default: false
    register_option :add_high_voltage           , type: :boolean, default: false
    register_option :add_generators             , type: :boolean, default: false
    register_option :add_lograge                , type: :boolean, default: false
    register_option :add_pundit                 , type: :boolean, default: false
    register_option :add_services               , type: :boolean, default: false
    register_option :add_sidekiq                , type: :boolean, default: false
    register_option :add_views                  , type: :boolean, default: false
    register_option :add_errors                 , type: :boolean, default: false
    register_option :add_scaffold               , type: :boolean, default: false
    register_option :add_factory_bot            , type: :boolean, default: false
    register_option :add_shoulda                , type: :boolean, default: false

    # NEW GEM ADDONS
    register_option :add_acts_as_list           , type: :boolean, default: false
    register_option :add_browser                , type: :boolean, default: false
    register_option :add_chartkick              , type: :boolean, default: false
    register_option :add_faker                  , type: :boolean, default: false
    register_option :add_groupdate              , type: :boolean, default: false
    register_option :add_honeybadger            , type: :boolean, default: false
    register_option :add_rails_html_sanitizer   , type: :boolean, default: false
    register_option :add_twilio_ruby            , type: :boolean, default: false

    # if options[:minimal]
    #   self.options = options.merge(
    #     skip_action_cable: true,
    #     skip_action_mailer: true,
    #     skip_action_mailbox: true,
    #     skip_action_text: true,
    #     skip_active_job: true,
    #     skip_active_storage: true,
    #     skip_bootsnap: true,
    #     skip_dev_gems: true,
    #     skip_javascript: true,
    #     skip_jbuilder: true,
    #     skip_system_test: true,
    #     skip_hotwire: true).freeze
    # end
  end
end
