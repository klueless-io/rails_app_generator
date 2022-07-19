# frozen_string_literal: true

RSpec.describe RailsAppGenerator::BuildOption do
  let(:instance) { described_class.new(**opts) }
  let(:opts) { {} }

  describe 'initialize' do
    subject { instance }

    it { is_expected.to be_a described_class }

    context 'when name only' do
      let(:opts) { { name: :xmen } }

      it { is_expected.to have_attributes(name: :xmen, description: '', type: :string, default: '', required: false) }
    end

    context 'when name and description' do
      let(:opts) { { name: :xmen, description: 'crazy xmen' } }

      it { is_expected.to have_attributes(name: :xmen, description: 'crazy xmen', type: :string, default: '', required: false) }
    end

    context 'when type is configured' do
      context 'as :integer' do
        let(:opts) { { name: :xmen, type: :integer } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :integer, default: 0, required: false) }
      end

      context 'as :boolean' do
        let(:opts) { { name: :xmen, type: :boolean } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :boolean, default: false, required: false) }
      end

      context 'as :array' do
        let(:opts) { { name: :xmen, type: :array } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :array, default: [], required: false) }
      end

      context 'as :hash' do
        let(:opts) { { name: :xmen, type: :hash } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :hash, default: {}, required: false) }
      end
    end

    context 'when required is configured' do
      context 'as true' do
        let(:opts) { { name: :xmen, required: true } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :string, default: '', required: true) }
      end

      context 'as false' do
        let(:opts) { { name: :xmen, required: false } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :string, default: '', required: false) }
      end

      context 'when type is mis-configured' do
        let(:opts) { { name: :xmen, type: :integer, required: nil } }

        it { expect { instance }.to raise_error(ArgumentError) }
      end
    end
  end
end
