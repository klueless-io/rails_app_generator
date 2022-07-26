# frozen_string_literal: true

module RailsAppGenerator
  module Diff
    # CompareInfo stores LHS and RHS file information in segments
    class CompareInfo
      attr_reader :lhs_path
      attr_reader :lhs_files

      attr_reader :rhs_path
      attr_reader :rhs_files

      # File segments
      attr_reader :lhs_only
      attr_reader :rhs_only
      attr_reader :diff
      attr_reader :same

      def initialize(lhs_path, lhs_files, rhs_path, rhs_files)
        @lhs_path                 = lhs_path
        @lhs_files                = lhs_files

        @rhs_path                 = rhs_path
        @rhs_files                = rhs_files

        @lhs_only                 = []
        @rhs_only                 = []
        @diff                     = []
        @same                     = []

        segment_files(lhs_path, lhs_files, rhs_path, rhs_files)
      end

      def debug
        debug_stats
        debug_files('left only'   , lhs_only)
        debug_files('right only'  , rhs_only)
        debug_files('same'        , same)
        debug_files('diff'        , diff)
      end

      private

      # rubocop:disable Metrics/AbcSize
      def segment_files(lhs_path, lhs_files, rhs_path, rhs_files)
        lhs_only = lhs_files - rhs_files
        rhs_only = rhs_files - lhs_files
        matching_files = lhs_files & rhs_files

        @lhs_only = lhs_only.map { |file| FilePair.new(file, lhs_file: File.join(lhs_path, file)) }
        @rhs_only = rhs_only.map { |file| FilePair.new(file, rhs_file: File.join(rhs_path, file)) }

        matching_files.each do |file|
          file_pair = FilePair.new(
            file,
            lhs_file: File.join(lhs_path, file),
            rhs_file: File.join(rhs_path, file)
          )

          if FileUtils.compare_file(File.join(lhs_path, file), File.join(rhs_path, file))
            @same << file_pair
          else
            @diff << file_pair
          end
        end
      end
      # rubocop:enable Metrics/AbcSize

      def rel_abs_file(path, files)
        files.map { |file| FilePair.new(file, File.join(path, file)) }
      end

      # rubocop:disable Metrics/AbcSize
      def debug_stats
        Util.kv('left path'               , lhs_path)
        Util.kv('right path'              , rhs_path)

        Util.kv('file count - left'       , lhs_files.count)
        Util.kv('file count - right'      , rhs_files.count)

        Util.kv('file count - left only'  , lhs_only.count)
        Util.kv('file count - right only' , rhs_only.count)

        Util.kv('file count - same'       , same.count)
        Util.kv('file count - different'  , diff.count)
      end
      # rubocop:enable Metrics/AbcSize

      def debug_files(heading, files)
        Util.line(heading)
        puts files.any? ? files.map(&:file) : 'NO FILES'
      end
    end
  end
end
