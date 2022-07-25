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

  context 'compare' do
    subject { instance.compare }

    it do
      is_expected.to have_attributes(
        lhs_only: include('a_only.txt'),
        rhs_only: include('b_only.txt'),
        diff_list: include('d_diff.txt'),
        same_list: include('c_same.txt', 'child/e_same.txt')
      )
    end

    context 'when custom exclusion handler' do
      before do
        instance.exclusion_handler = lambda do |_file, relative_file|
          relative_file.start_with?('node_modules')
        end
      end

      it do
        is_expected.to have_attributes(
          lhs_only: include('a_only.txt', 'tmp/a_only.txt'),
          rhs_only: include('b_only.txt', 'tmp/b_only.txt'),
          diff_list: include('d_diff.txt'),
          same_list: include('c_same.txt', 'tmp/temp_file.txt', 'child/e_same.txt')
        )
      end
    end
  end
end
