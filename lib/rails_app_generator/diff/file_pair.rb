# frozen_string_literal: true

module RailsAppGenerator
  module Diff
    # FilePair stores the relative file path, plus the absolute file for both Left and Right site
    class FilePair
      attr_reader :file
      attr_reader :lhs_absolute_file
      attr_reader :rhs_absolute_file

      def initialize(file, lhs_absolute_file: nil, rhs_absolute_file: nil)
        @file = file
        @lhs_absolute_file = lhs_absolute_file
        @rhs_absolute_file = rhs_absolute_file
      end
    end
  end
end
