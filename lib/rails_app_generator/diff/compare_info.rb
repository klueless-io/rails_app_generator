# frozen_string_literal: true

module RailsAppGenerator
  module Diff
    # CompareInfo information
    class CompareInfo
      attr_reader :lhs_path
      attr_reader :lhs_files
      attr_reader :lhs_only

      attr_reader :rhs_path
      attr_reader :rhs_files
      attr_reader :rhs_only

      attr_reader :diff_list
      attr_reader :same_list

      def initialize(lhs_path, lhs_files, rhs_path, rhs_files)
        @lhs_path   = lhs_path
        @lhs_files  = lhs_files
        @lhs_only   = []

        @rhs_path   = rhs_path
        @rhs_files  = rhs_files
        @rhs_only   = []

        @diff_list  = []
        @same_list  = []

        separate_files(lhs_path, lhs_files, rhs_path, rhs_files)
      end

      def debug
        debug_stats
        debug_files('left only', lhs_only)
        debug_files('right only', rhs_only)
        debug_files('same', same_list)
        debug_files('diff', diff_list)
      end

      private

      def separate_files(lhs_path, lhs_files, rhs_path, rhs_files)
        @lhs_only = lhs_files - rhs_files
        @rhs_only = rhs_files - lhs_files

        matching_files = lhs_files & rhs_files

        matching_files.each do |file|
          if FileUtils.compare_file(File.join(lhs_path, file), File.join(rhs_path, file))
            @same_list << file
          else
            @diff_list << file
          end
        end
      end

      # rubocop:disable Metrics/AbcSize
      def debug_stats
        Util.kv('left path'               , lhs_path)
        Util.kv('right path'              , rhs_path)

        Util.kv('file count - left'       , lhs_files.count)
        Util.kv('file count - right'      , rhs_files.count)

        Util.kv('file count - left only'  , lhs_only.count)
        Util.kv('file count - right only' , rhs_only.count)

        Util.kv('file count - same'       , same_list.count)
        Util.kv('file count - different'  , diff_list.count)
      end
      # rubocop:enable Metrics/AbcSize

      def debug_files(heading, files)
        Util.line(heading)
        puts files.any? ? files : 'NO FILES'
      end
    end
  end
end
