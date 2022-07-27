# frozen_string_literal: true

module RailsAppGenerator
  module Diff
    # Diff Report
    class OpenInEditor
      attr_reader :info

      attr_reader :open_left_only
      attr_reader :open_right_only
      attr_reader :open_same
      attr_reader :open_different

      def initialize(compare_info, **opts)
        @info = compare_info

        @open_left_only   = opts[:open_left_only].nil?  ? false : opts[:open_left_only]
        @open_right_only  = opts[:open_right_only].nil? ? false : opts[:open_right_only]
        @open_same        = opts[:open_same].nil?       ? false : opts[:open_same]
        @open_different   = opts[:open_different].nil?  ? true  : opts[:open_different]
      end

      def open
        open_files(info.lhs_only)   if open_left_only
        open_files(info.rhs_only)   if open_right_only
        open_files(info.same)       if open_same
        open_files(info.diff)       if open_different
      end

      private

      def open_files(files)
        files.map do |f|
          system("code --diff #{f.lhs_file} #{f.rhs_file}")
        end
      end
    end
  end
end
