# frozen_string_literal: true

module RailsAppGenerator
  # Thor CLI
  class Cli < Thor
    desc 'diff lhs_folder rhs_folder [options]', 'Diff two different rails folders'
    option :lhs     , type: :boolean
    option :rhs     , type: :boolean
    option :compare , type: :boolean

    def diff(lhs_folder, rhs_folder)
      # puts "Diffing #{lhs_folder} and #{rhs_folder}"
      # puts JSON.pretty_generate(options)
      processor = RailsAppGenerator::Diff::Processor.new(lhs_folder, rhs_folder)
      compare_info = processor.compare

      compare_info.debug

      # report = RailsAppGenerator::Diff::Report.new(compare_info)
      # report.display
    end

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
