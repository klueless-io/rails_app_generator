# frozen_string_literal: true

RSpec.describe RailsAppGenerator::Diff::Processor do
  let(:instance) { described_class.new(lhs_path, rhs_path) }
  let(:lhs_path) { "#{RSPEC_ROOT}/sample/lhs" }
  let(:rhs_path) { "#{RSPEC_ROOT}/sample/rhs" }

  context 'initialize' do
    context '.lhs_path' do
      subject { instance.lhs_path }

      it { is_expected.to eq lhs_path }
    end

    context '.rhs_path' do
      subject { instance.rhs_path }

      it { is_expected.to eq rhs_path }
    end
  end

  context '.compare' do
    context 'when default exclusion handler' do
      describe '.lhs_only' do
        subject { instance.compare.lhs_only }

        it do
          expected = fp('a_only.txt', 'a_only.txt', nil)

          is_expected.to include(have_attributes(file: expected.file, lhs_absolute_file: expected.lhs_absolute_file, rhs_absolute_file: expected.rhs_absolute_file))
        end
      end

      describe '.rhs_only' do
        subject { instance.compare.rhs_only }

        it do
          expected = fp('b_only.txt', nil, 'b_only.txt')

          is_expected.to include(have_attributes(file: expected.file, lhs_absolute_file: expected.lhs_absolute_file, rhs_absolute_file: expected.rhs_absolute_file))
        end
      end

      describe '.diff' do
        subject { instance.compare.diff }

        it do
          expected = fp('d_diff.txt', 'd_diff.txt', 'd_diff.txt')

          is_expected.to include(have_attributes(file: expected.file, lhs_absolute_file: expected.lhs_absolute_file, rhs_absolute_file: expected.rhs_absolute_file))
        end
      end

      describe '.same' do
        subject { instance.compare.same }

        it do
          expected1 = fp('c_same.txt', 'c_same.txt', 'c_same.txt')
          expected2 = fp('child/e_same.txt', 'child/e_same.txt', 'child/e_same.txt')

          is_expected.to include(
            have_attributes(file: expected1.file, lhs_absolute_file: expected1.lhs_absolute_file, rhs_absolute_file: expected1.rhs_absolute_file),
            have_attributes(file: expected2.file, lhs_absolute_file: expected2.lhs_absolute_file, rhs_absolute_file: expected2.rhs_absolute_file)
          )
        end
      end
    end

    context 'when default exclusion handler' do
      before do
        instance.exclusion_handler = lambda do |_file, relative_file|
          relative_file.start_with?('node_modules')
        end
      end

      describe '.lhs_only' do
        subject { instance.compare.lhs_only }

        it do
          expected1 = fp('a_only.txt', 'a_only.txt', nil)
          expected2 = fp('tmp/a_only.txt', 'tmp/a_only.txt', nil)

          is_expected.to include(
            have_attributes(file: expected1.file, lhs_absolute_file: expected1.lhs_absolute_file, rhs_absolute_file: expected1.rhs_absolute_file),
            have_attributes(file: expected2.file, lhs_absolute_file: expected2.lhs_absolute_file, rhs_absolute_file: expected2.rhs_absolute_file)
          )
        end
      end

      describe '.rhs_only' do
        subject { instance.compare.rhs_only }

        it do
          expected1 = fp('b_only.txt', nil, 'b_only.txt')
          expected2 = fp('tmp/b_only.txt', nil, 'tmp/b_only.txt')

          is_expected.to include(
            have_attributes(file: expected1.file, lhs_absolute_file: expected1.lhs_absolute_file, rhs_absolute_file: expected1.rhs_absolute_file),
            have_attributes(file: expected2.file, lhs_absolute_file: expected2.lhs_absolute_file, rhs_absolute_file: expected2.rhs_absolute_file)
          )
        end
      end

      describe '.diff' do
        subject { instance.compare.diff }

        it do
          expected = fp('d_diff.txt', 'd_diff.txt', 'd_diff.txt')

          is_expected.to include(have_attributes(file: expected.file, lhs_absolute_file: expected.lhs_absolute_file, rhs_absolute_file: expected.rhs_absolute_file))
        end
      end

      describe '.same' do
        subject { instance.compare.same }

        it do
          expected1 = fp('c_same.txt', 'c_same.txt', 'c_same.txt')
          expected2 = fp('child/e_same.txt', 'child/e_same.txt', 'child/e_same.txt')

          is_expected.to include(
            have_attributes(file: expected1.file, lhs_absolute_file: expected1.lhs_absolute_file, rhs_absolute_file: expected1.rhs_absolute_file),
            have_attributes(file: expected2.file, lhs_absolute_file: expected2.lhs_absolute_file, rhs_absolute_file: expected2.rhs_absolute_file)
          )
        end
      end
    end
  end
end
