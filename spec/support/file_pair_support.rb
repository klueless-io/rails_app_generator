# frozen_string_literal: true

def fp(file, lhs = nil, rhs = nil)
  lhs = File.join(lhs_path, lhs) if lhs
  rhs = File.join(rhs_path, rhs) if rhs
  RailsAppGenerator::Diff::FilePair.new(file, lhs_file: lhs, rhs_file: rhs)
end
