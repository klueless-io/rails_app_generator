# frozen_string_literal: true

RSpec.describe RailsAppGenerator::OptionsBuilder do
  let(:instance) { described_class.new(opts) }
  let(:opts) { {} }

  describe 'initialize' do
    subject { instance }

    it { is_expected.to be_a described_class }
  end

  describe '#BuildOptions.class_option' do
    before { described_class.reset }

    subject { described_class.class_options }

    it { is_expected.to be_a Array }

    context 'when registering an option' do
      context 'when name only' do
        before { described_class.class_option(:xmen) }

        it { is_expected.to include(have_attributes(name: :xmen, desc: '', type: :string, default: '', required: false)) }
      end

      context 'when name and description' do
        before { described_class.class_option(:xmen, desc: 'crazy xmen') }

        it { is_expected.to include(have_attributes(name: :xmen, desc: 'crazy xmen', type: :string, default: '', required: false)) }
      end
    end
  end

  describe '.options' do
    before { described_class.reset }

    subject { instance.options }

    it { is_expected.to eq({}) }

    context 'when options have been class' do
      before do
        described_class.class_option(:xmen)
        described_class.class_option(:my_count, type: :integer, default: 53)
        described_class.class_option(:active, type: :boolean, default: true)
        described_class.class_option(:primary, type: :boolean)
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

  describe '#cmd_line_options' do
    subject { instance.cmd_line_options }

    before do
      described_class.reset
      described_class.class_option :skip_git, type: :boolean, default: false, desc: 'Skip .gitignore file'
    end

    context 'when opts is empty' do
      it { is_expected.to eq([]) }
    end

    context 'when skip_git is true' do
      let(:opts) { { skip_git: true } }

      it { is_expected.to eq(['--skip-git']) }
    end

    context 'when skip_git is false' do
      let(:opts) { { skip_git: false } }

      it { is_expected.to eq([]) }
    end
  end
end
