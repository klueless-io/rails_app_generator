# frozen_string_literal: true

module RailsAppGenerator
  module Cli
    # Folder Diff
    class Profile < Thor
      desc 'xxx [options]', 'Create a new rails app based on a RAG profile'

      option :profile_path            , type: :string
      option :fallback_profile_path   , type: :string

      # rubocop:disable Metrics/AbcSize
      def profile(name)
        path          = options[:profile_path] || options[:fallback_profile_path]
        profile_name  = name.end_with?('.json') ? name : "#{name}.json"
        profile_file  = File.join(path, profile_name)

        unless File.exist?(profile_file)
          puts "Profile [#{profile_file}] not found"
          exit 1
        end

        puts "Using profile #{profile_file}"

        profile       = JSON.parse(File.read(profile_file), symbolize_names: true)
        args          = profile[:args]
        opts          = RailsAppGenerator::RailsOptions.new(profile[:opts])

        starter       = RailsAppGenerator::Starter.new(args)

        starter.delete_target_folder
        starter.start(opts)
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
