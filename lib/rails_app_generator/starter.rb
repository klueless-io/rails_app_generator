# frozen_string_literal: true

require 'rails'

require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
# require 'active_model/railtie'
# active_record/railtie
# active_storage/engine
# action_controller/railtie
# action_view/railtie
# action_mailer/railtie
# active_job/railtie
# action_cable/engine
# action_mailbox/engine
# action_text/engine
# rails/test_unit/railtie

module RailsAppGenerator
  #  Starter is a wrapper for Rails::AppGenerator
  #
  # example:
  #   RailsAppGenerator::Starter.new.start
  #   RailsAppGenerator::Starter.new(app_path: '.', destination_root: Dir.pwd).start
  #   RailsAppGenerator::Starter.new(app_path: 'xmen', destination_root: '~/projects_path').start
  #   RailsAppGenerator::Starter.new(app_path: '.', destination_root: '~/projects_path/xmen').start
  class Starter
    # include KLog::Logging

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
      puts "Target path: #{target_path}"

      RailsAppGenerator::AppGenerator.source_root(rails_template_path)
      RailsAppGenerator::AppGenerator.source_paths << rails_template_path
      RailsAppGenerator::AppGenerator.source_paths << custom_template_path

      opts = [
        '--skip-namespace',
        '--skip-collision-check',
        '--skip-git',
        '--skip-keeps',
        '--skip-action-mailer',
        '--skip-action-mailbox',
        '--skip-action-text',
        '--skip-active-record',
        '--skip-active-job',
        '--skip-active-storage',
        '--skip-action-cable',
        '--skip-asset-pipeline',
        '--skip-javascript',
        '--skip-hotwire',
        '--skip-jbuilder',
        '--skip-test',
        '--skip-system-test',
        '--skip-bootsnap',
        '--skip-bundle'
      ]

      opts = [
        '--skip-git',
        '--skip-test',
        '--skip-bundle'
      ]

      RailsAppGenerator::AppGenerator.start ['.'] + opts, destination_root: destination_root
    end
  end
end
