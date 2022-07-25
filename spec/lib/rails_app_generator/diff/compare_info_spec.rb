# frozen_string_literal: true

RSpec.describe RailsAppGenerator::Diff::CompareInfo do
  subject { instance }

  let(:instance) { described_class.new(lhs_path, lhs_files, rhs_path, rhs_files) }
  let(:lhs_path) { "#{RSPEC_ROOT}/sample/lhs/" }
  let(:rhs_path) { "#{RSPEC_ROOT}/sample/rhs/" }
  let(:lhs_files) { [] }
  let(:rhs_files) { [] }

  context 'initialize' do
    it {
      is_expected.to have_attributes(
        lhs_only: [],
        rhs_only: [],
        diff_list: [],
        same_list: []
      )
    }

    context 'when files on the left side' do
      let(:lhs_files) { ['a_only.txt', 'c_same.txt', 'd_diff.txt', 'child/e_same.txt'] }
      let(:rhs_files) { ['b_only.txt', 'c_same.txt', 'd_diff.txt', 'child/e_same.txt'] }

      it {
        is_expected.to have_attributes(
          lhs_only: ['a_only.txt'],
          rhs_only: ['b_only.txt'],
          diff_list: ['d_diff.txt'],
          same_list: ['c_same.txt', 'child/e_same.txt']
        )
      }

      # describe '#debug' do
      #   subject { instance.debug }

      #   it { subject }
      # end
    end
  end
end
