# frozen_string_literal: true

RSpec.describe RailsAppGenerator::Diff::OpenInEditor do
  let(:instance) { described_class.new(compare_info, **opts) }
  let(:opts) { {} }
  let(:processor) { RailsAppGenerator::Diff::Processor.new(lhs_path, rhs_path) }
  let(:compare_info) { processor.compare }
  let(:lhs_path) { "#{RSPEC_ROOT}/sample/lhs" }
  let(:rhs_path) { "#{RSPEC_ROOT}/sample/rhs" }

  context 'initialize' do
    subject { instance }

    context '.info' do
      subject { instance.info }

      it { is_expected.to eq(compare_info) }
    end
  end

  context 'open' do
    subject { instance }

    it { is_expected.to respond_to(:open) }

    # context 'when default options' do
    #   # Should only see target and different files
    #   it { subject.open }
    # end

    # context 'when all options are on' do
    #   let(:opts) { { open_left_only: true, open_right_only: true, open_same: true, open_different: true } }

    #   # Should see all files
    #   it { subject.open }

    #   context 'when exclusions are removed' do
    #     before { processor.exclusion_handler = ->(_file, relative_file) {} }

    #     # Should see all files, including files in node_modules and tmp
    #     it { subject.open }
    #   end
    # end
  end
end
