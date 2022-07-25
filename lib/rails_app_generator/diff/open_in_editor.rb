# frozen_string_literal: true

# module RailsAppGenerator
#   module Diff
#     # Diff Report
#     class OpenInEditor
#       attr_reader :info

#       attr_reader :open_left_only
#       attr_reader :open_right_only
#       attr_reader :open_same
#       attr_reader :open_different

#       def initialize(compare_info, **opts)
#         @info = compare_info

#         @open_left_only   = opts[:open_left_only].nil?  ? false : opts[:open_left_only]
#         @open_right_only  = opts[:open_right_only].nil? ? true  : opts[:open_right_only]
#         @open_same        = opts[:open_same].nil?       ? false : opts[:open_same]
#         @open_different   = opts[:open_different].nil?  ? true  : opts[:open_different]
#       end

#       def open
#         open_files('Files only in source folder' , info.lhs_only) if open_left_only
#         open_files('Files only in target folder' , info.rhs_only) if open_right_only
#         open_files('Files in both folders'       , info.same_list) if open_same
#         open_files('Files that are different'    , info.diff_list) if open_different
#       end

#       private

#       def open_files(heading, files)
#         puts files.any? ? files.map { |f| f } : 'NO FILES'
#       end

#       def vscode_compare_files
#         files_that_are_different.map do |file|
#           system("code --diff #{File.join(lhs_path, file)} #{File.join(rhs_path, file)}")
#         end
#       end

#     end
#   end
# end
