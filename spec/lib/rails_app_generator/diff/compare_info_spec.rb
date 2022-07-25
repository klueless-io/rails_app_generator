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
        diff: [],
        same: []
      )
    }
  end

  context 'when files exist in left and right folders' do
    let(:lhs_files) { ['a_only.txt', 'c_same.txt', 'd_diff.txt', 'child/e_same.txt'] }
    let(:rhs_files) { ['b_only.txt', 'c_same.txt', 'd_diff.txt', 'child/e_same.txt'] }

    describe '.lhs_only' do
      subject { instance.lhs_only }

      it do
        expected = fp('a_only.txt', 'a_only.txt', nil)

        is_expected.to include(have_attributes(file: expected.file, lhs_absolute_file: expected.lhs_absolute_file, rhs_absolute_file: expected.rhs_absolute_file))
      end
    end

    describe '.rhs_only' do
      subject { instance.rhs_only }

      it do
        expected = fp('b_only.txt', nil, 'b_only.txt')

        is_expected.to include(have_attributes(file: expected.file, lhs_absolute_file: expected.lhs_absolute_file, rhs_absolute_file: expected.rhs_absolute_file))
      end
    end

    describe '.diff' do
      subject { instance.diff }

      it do
        expected = fp('d_diff.txt', 'd_diff.txt', 'd_diff.txt')

        is_expected.to include(have_attributes(file: expected.file, lhs_absolute_file: expected.lhs_absolute_file, rhs_absolute_file: expected.rhs_absolute_file))
      end
    end

    describe '.same' do
      subject { instance.same }

      it do
        expected1 = fp('c_same.txt', 'c_same.txt', 'c_same.txt')
        expected2 = fp('child/e_same.txt', 'child/e_same.txt', 'child/e_same.txt')

        is_expected.to include(
          have_attributes(file: expected1.file, lhs_absolute_file: expected1.lhs_absolute_file, rhs_absolute_file: expected1.rhs_absolute_file),
          have_attributes(file: expected2.file, lhs_absolute_file: expected2.lhs_absolute_file, rhs_absolute_file: expected2.rhs_absolute_file)
        )
      end
    end

    # describe '#lfhs_file_info' do
    #   subject { instance.lhs_file_info(type) }

    #   context 'when type is :lhs_only' do
    #     let(:type) { :lhs_only }

    #     it do
    #       is_expected.to include(
    #         have_attributes(
    #           relative_file: 'a_only.txt',
    #           absolute_file: File.join(lhs_path, 'a_only.txt')
    #         )
    #       )
    #     end
    #   end

    #   context 'when type is :rhs_only' do
    #     let(:type) { :rhs_only }

    #     it { is_expected.to be_empty }
    #   end

    #   context 'when type is :diff' do
    #     let(:type) { :diff }

    #     it do
    #       is_expected.to include(
    #         have_attributes(
    #           relative_file: 'd_diff.txt',
    #           absolute_file: File.join(lhs_path, 'd_diff.txt')
    #         )
    #       )
    #     end
    #   end

    #   context 'when type is :same' do
    #     let(:type) { :same }

    #     it do
    #       is_expected.to include(
    #         have_attributes(
    #           relative_file: 'c_same.txt',
    #           absolute_file: File.join(lhs_path, 'c_same.txt')
    #         )
    #       )
    #     end
    #   end
    # end

    # describe '#rhs_file_info' do
    #   subject { instance.rhs_file_info(type) }

    #   context 'when type is :lhs_only' do
    #     let(:type) { :lhs_only }

    #     it { is_expected.to be_empty }
    #   end

    #   context 'when type is :rhs_only' do
    #     let(:type) { :rhs_only }

    #     it do
    #       is_expected.to include(
    #         have_attributes(
    #           relative_file: 'b_only.txt',
    #           absolute_file: File.join(rhs_path, 'b_only.txt')
    #         )
    #       )
    #     end
    #   end

    #   context 'when type is :diff' do
    #     let(:type) { :diff }

    #     it do
    #       is_expected.to include(
    #         have_attributes(
    #           relative_file: 'd_diff.txt',
    #           absolute_file: File.join(rhs_path, 'd_diff.txt')
    #         )
    #       )
    #     end
    #   end

    #   context 'when type is :same' do
    #     let(:type) { :same }

    #     it do
    #       is_expected.to include(
    #         have_attributes(
    #           relative_file: 'c_same.txt',
    #           absolute_file: File.join(rhs_path, 'c_same.txt')
    #         )
    #       )
    #     end
    #   end
    # end
  end
end
