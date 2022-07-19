# frozen_string_literal: true

RSpec.describe RailsAppGenerator::RailsOptions do
  let(:instance) { described_class.new(opts) }
  let(:opts) { {} }

  describe 'initialize' do
    subject { instance }

    it { is_expected.to be_a described_class }
  end

  # describe '.debug' do
  #   it { instance.debug }
  # end
  describe '.cmd_line_options' do
    subject { instance.cmd_line_options }

    # context 'no settings' do
    #   it { is_expected.to be_empty }
    #   it { is_expected.to be_empty }
    # end

    context 'basic settings' do
      let(:opts) do
        {
          skip_git: true,
          skip_bundle: true,
          test: 'rspec'
        }
      end

      it { is_expected.to eq(['--skip-git', '--test=rspec', '--skip-bundle']) }
    end
  end
end
