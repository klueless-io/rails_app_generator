# frozen_string_literal: true

module RailsAppGenerator
  module Cli
    class Main < Thor
      include RailsAppGenerator::Cli::Diff

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
end