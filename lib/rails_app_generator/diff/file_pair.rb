# frozen_string_literal: true

module RailsAppGenerator
  module Diff
    # FilePair stores the relative file path, plus the absolute file for both Left and Right site
    class FilePair
      attr_reader :file       # relative file
      attr_reader :lhs_file   # absolute file for left hand side
      attr_reader :rhs_file   # absolute file for right hand side

      def initialize(file, lhs_file: nil, rhs_file: nil)
        @file = file
        @lhs_file = lhs_file
        @rhs_file = rhs_file
      end
    end
  end
end
