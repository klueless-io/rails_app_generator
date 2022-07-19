# frozen_string_literal: true

RSpec.describe RailsAppGenerator::BuildOptions do
  let(:instance) { described_class.new(opts) }
  let(:opts) { {} }

  describe 'initialize' do
    subject { instance }

    it { is_expected.to be_a described_class }
  end

  describe '#BuildOptions.register' do
    subject { described_class.registered_options }

    it { is_expected.to be_a Array }

    context 'when registering an option' do
      context 'when name only' do
        before { described_class.register(:xmen) }

        it { is_expected.to include(have_attributes(name: :xmen, description: '', type: :string, default: '', required: false)) }
      end

      context 'when name and description' do
        before { described_class.register(:xmen, description: 'crazy xmen') }

        it { is_expected.to include(have_attributes(name: :xmen, description: 'crazy xmen', type: :string, default: '', required: false)) }
      end
    end
  end

  describe '.options' do
    before { described_class.reset }

    subject { instance.options }

    it { is_expected.to eq({}) }

    context 'when options have been registered' do
      before do
        described_class.register(:xmen)
        described_class.register(:my_count, type: :integer, default: 53)
        described_class.register(:active, type: :boolean, default: true)
        described_class.register(:primary, type: :boolean)
      end

      context 'but not set' do
        it { is_expected.to include(xmen: '', my_count: 53, active: true, primary: false) }
      end

      context 'options are set' do
        let(:opts) { { xmen: 'wolverine', my_count: 42, active: false } }

        it { is_expected.to include(xmen: 'wolverine', my_count: 42, active: false, primary: false) }
      end
    end
  end

  # describe '#rails_options' do
  #   subject { instance.rails_options }

  #   context 'when opts is empty' do
  #     it { is_expected.to eq([]) }
  #   end

  #   context 'when skip_git is true' do
  #     let(:opts) { { skip_git: true } }

  #     it { is_expected.to eq(['--skip-git']) }
  #   end
  # end

  #   "--skip-git",
  #   "--skip-test",
  #   "--skip-bundle"
end
