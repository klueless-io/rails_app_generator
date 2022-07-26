# frozen_string_literal: true

module RailsAppGenerator
  # Thor CLI
  class Cli < Thor
    desc 'diff lhs_folder rhs_folder [options]', 'Diff two different rails folders'

    # Run report to console for following options
    option :show_left_only  , type: :boolean
    option :show_right_only , type: :boolean
    option :show_same       , type: :boolean
    option :show_different  , type: :boolean

    # Open files in VSCode for for following options
    option :open_left_only  , type: :boolean
    option :open_right_only , type: :boolean
    option :open_same       , type: :boolean
    option :open_different  , type: :boolean

    # rubocop:disable Metrics/AbcSize
    def diff(lhs_folder, rhs_folder)
      # puts "Diffing #{lhs_folder} and #{rhs_folder}"
      # puts JSON.pretty_generate(options)
      processor = RailsAppGenerator::Diff::Processor.new(lhs_folder, rhs_folder)
      compare_info = processor.compare

      report = RailsAppGenerator::Diff::Report.new(
        compare_info,
        show_left_only: options[:show_left_only],
        show_right_only: options[:show_right_only],
        show_same: options[:show_same],
        show_different: options[:show_different]
      )
      report.display

      vscode = RailsAppGenerator::Diff::OpenInEditor.new(
        compare_info,
        open_left_only: options[:open_left_only],
        open_right_only: options[:open_right_only],
        open_same: options[:open_same],
        open_different: options[:show_different]
      )
      vscode.open
    end
    # rubocop:enable Metrics/AbcSize

    # def initialize(profile_file)
    #   @profile_file = profile_file
    # end

    # def run
    #   puts "Using profile #{profile_file}"

    #   profile = JSON.parse(File.read(profile_file), symbolize_names: true)
    #   args = profile[:args]
    #   opts = profile[:opts]
    #   rails_options = RailsAppGenerator::RailsOptions.new(opts)

    #   instance = RailsAppGenerator::Starter.new(args)
    #   FileUtils.rm_rf(instance.target_path)
    #   instance.start(rails_options)
    # end
  end
end
