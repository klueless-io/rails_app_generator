# frozen_string_literal: true

module RailsAppGenerator
  module Diff
    # Diff Processor
    class Processor
      attr_reader :lhs_path
      attr_reader :rhs_path

      DEFAULT_EXCLUSION = lambda do |_file, relative_file|
        relative_file.start_with?('tmp') ||
          relative_file.start_with?('node_modules') ||
          relative_file.start_with?('log') ||
          relative_file.start_with?('db') ||
          relative_file.start_with?('app/assets/builds') ||
          relative_file.casecmp?('gemfile.lock') ||
          relative_file.casecmp?('package.lock') ||
          relative_file.casecmp?('package-lock.json') ||
          relative_file.casecmp?('yarn.lock') ||
          relative_file == 'config/master.key' ||
          relative_file == 'config/credentials.yml.enc'
      end

      def initialize(lhs_path, rhs_path)
        @lhs_path = lhs_path
        @rhs_path = rhs_path
      end

      attr_writer :exclusion_handler

      def compare
        @info ||= RailsAppGenerator::Diff::CompareInfo.new(
          lhs_path, file_list(lhs_path),
          rhs_path, file_list(rhs_path)
        )
      end

      def debug
        compare.debug
      end

      private

      def exclusion_handler
        @exclusion_handler ||= DEFAULT_EXCLUSION
      end

      def file_list(path)
        prefix_path = path.end_with?('/') ? path : "#{path}/"

        Dir.glob("#{path}/**/*")
           .reject { |file| File.directory?(file) || exclusion_handler.call(file, file.delete_prefix(prefix_path)) }
           .map { |file| file.delete_prefix(prefix_path) }
      end

      # def diff_exclusions(file)
      #   file.include?('config/credentials.yml.enc') ||
      #     file.include?('master.key')
      # end
    end
  end
end
