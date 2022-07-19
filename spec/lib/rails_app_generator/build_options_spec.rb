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

      context 'when type is configured' do
        context 'as :integer' do
          before { described_class.register(:xmen, type: :integer) }

          it { is_expected.to include(have_attributes(name: :xmen, description: '', type: :integer, default: 0, required: false)) }
        end

        context 'as :boolean' do
          before { described_class.register(:xmen, type: :boolean) }

          it { is_expected.to include(have_attributes(name: :xmen, description: '', type: :boolean, default: false, required: false)) }
        end

        context 'as :array' do
          before { described_class.register(:xmen, type: :array) }

          it { is_expected.to include(have_attributes(name: :xmen, description: '', type: :array, default: [], required: false)) }
        end

        context 'as :hash' do
          before { described_class.register(:xmen, type: :hash) }

          it { is_expected.to include(have_attributes(name: :xmen, description: '', type: :hash, default: {}, required: false)) }
        end
      end
    end
  end

  describe '#options' do
    subject { instance.options }

    it { is_expected.to be_a Hash }

    context 'when registered options' do
      context 'are not set' do
        # it { is_expected.to be_empty }
      end

      context 'are set' do
        before { described_class.register(:xmen, description: 'crazy xmen') }

        # it { is_expected.to include(xmen: nil) }
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
