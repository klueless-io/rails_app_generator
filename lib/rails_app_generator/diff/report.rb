# frozen_string_literal: true

module RailsAppGenerator
  module Diff
    # Diff Report
    class Report
      attr_reader :info

      attr_reader :show_left_only
      attr_reader :show_right_only
      attr_reader :show_same
      attr_reader :show_different

      def initialize(compare_info, **opts)
        @info = compare_info

        @show_left_only   = opts[:show_left_only].nil?  ? false : opts[:show_left_only]
        @show_right_only  = opts[:show_right_only].nil? ? true  : opts[:show_right_only]
        @show_same        = opts[:show_same].nil?       ? false : opts[:show_same]
        @show_different   = opts[:show_different].nil?  ? true  : opts[:show_different]
      end

      def display
        display_files('Files only in source folder' , info.lhs_only) if show_left_only
        display_files('Files only in target folder' , info.rhs_only) if show_right_only
        display_files('Files in both folders'       , info.same) if show_same
        display_files('Files that are different'    , info.diff) if show_different
      end

      private

      def display_files(heading, files)
        Util.line(heading)
        puts files.any? ? files.map(&:file) : 'NO FILES'
      end
    end
  end
end
