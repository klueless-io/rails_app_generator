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
    attr_reader :console_output

    def initialize(**args)
      @app_path = args[:app_path] || '.'
      @destination_root = args[:destination_root] || Dir.pwd
      @rails_template_path = args[:rails_template_path] || Rails::Generators::AppGenerator.source_root
      @custom_template_path = args[:custom_template_path] || File.expand_path(File.join(__dir__, '../../templates'))
    end

    def target_path
      File.expand_path(File.join(destination_root, app_path))
    end

    def start(options = [])
      puts "Target path: #{target_path}"

      RailsAppGenerator::AppGenerator.source_root(rails_template_path)
      RailsAppGenerator::AppGenerator.source_paths << rails_template_path
      RailsAppGenerator::AppGenerator.source_paths << custom_template_path

      opts = extract_rails_options(app_path, options)

      @console_output = capture_console do
        RailsAppGenerator::AppGenerator.start(opts, destination_root: destination_root)
      end
    end

    private

    def capture_console
      $stdout = StringIO.new
      yield
      output = $stdout.string
      $stdout.close
      output
    ensure
      $stdout = STDOUT
      $stdout.puts output
    end

    # Rails options returns a flat array of options
    #
    # It can work accept a flat array of options or a
    # an object that implements cmd_line_options such as OptionsBuilder
    #
    # @param [Array<String>, OptionsBuilder] options
    # @return [Array<String>]
    def extract_rails_options(app_path, options)
      opts = nil
      opts = options.cmd_line_options if options.respond_to?(:cmd_line_options)
      opts = options if options.is_a?(Array)

      raise ArgumentError, 'options is required' unless opts

      [app_path] + opts
    end
  end
end
