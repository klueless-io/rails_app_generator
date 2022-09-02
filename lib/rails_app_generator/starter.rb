# frozen_string_literal: true

require 'rails'

require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

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

    # points to the original rails templates
    attr_reader :rails_template_path

    # points to the overriding templates related to rails
    attr_reader :override_template_path

    # points to templates related to rails addons
    attr_reader :addon_template_path

    attr_reader :target_folder_exist_action # [abort destroy keep_git overwrite]

    attr_reader :capture_output
    attr_reader :console_output

    # rubocop:disable Metrics/CyclomaticComplexity
    def initialize(**args)
      @app_path                   = args[:app_path]                     || '.'
      @destination_root           = args[:destination_root]             || Dir.pwd
      @rails_template_path        = args[:rails_template_path]          || AppGenerator.rails_template_path
      @override_template_path     = args[:override_template_path]       || AppGenerator.override_template_path
      @addon_template_path        = args[:addon_template_path]          || AppGenerator.addon_template_path
      @target_folder_exist_action = args[:target_folder_exist_action]   || 'abort'
      @capture_output             = args[:capture_output].nil? ? false : args[:capture_output]
    end
    # rubocop:enable Metrics/CyclomaticComplexity

    def target_path
      File.expand_path(File.join(destination_root, app_path))
    end

    def start(options = [])
      puts "Target path: #{target_path}"

      opts = extract_rails_options(app_path, options)

      if capture_output
        @console_output = Util.capture_console do
          RailsAppGenerator::AppGenerator.start(opts, destination_root: destination_root)
        end
      else
        RailsAppGenerator::AppGenerator.start(opts, destination_root: destination_root)
      end
    end

    def handle_target_folder_found?
      return true unless File.directory?(target_path)

      case target_folder_exist_action
      when 'abort'
        puts "Target folder [#{target_path}] already exists. Aborting"
        false
      when 'destroy'
        puts "Target folder [#{target_path}] already exists. Destroying it"
        FileUtils.rm_rf(target_path)
        true
      when 'keep_git'
        puts "Target folder [#{target_path}] already exists. Wiping it but keeping git history"
        clean_target_folder
        true
      when 'overwrite'
        puts "Target folder [#{target_path}] already exists. Overwriting it"
        true
      else
        raise "Invalid target_folder_exist_action: #{target_folder_exist_action}"
      end
    end

    private

    def clean_target_folder
      Dir.entries(target_path).each do |entry|
        entry_path = File.join(target_path, entry)

        next if ['.', '..', '.git'].include?(entry)

        if File.file?(entry_path)
          File.delete(entry_path)
        elsif File.directory?(entry_path)
          FileUtils.rm_rf(entry_path)
        end
      end
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
