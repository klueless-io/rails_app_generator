# frozen_string_literal: true

RSpec.describe RailsAppGenerator::BuildOption do
  let(:instance) { described_class.new(**opts) }
  let(:opts) { {} }

  describe 'initialize' do
    subject { instance }

    it { is_expected.to be_a described_class }

    context 'when name only' do
      let(:opts) { { name: :xmen } }

      it { is_expected.to have_attributes(name: :xmen, desc: '', type: :string, default: '', required: false, mapper: RailsAppGenerator::MapOptionValue) }
    end

    context 'when name and description' do
      let(:opts) { { name: :xmen, desc: 'crazy xmen' } }

      it { is_expected.to have_attributes(name: :xmen, desc: 'crazy xmen', type: :string, default: '', required: false, mapper: RailsAppGenerator::MapOptionValue) }
    end

    context 'when type is configured' do
      context 'as :integer' do
        let(:opts) { { name: :xmen, type: :integer } }

        it { is_expected.to have_attributes(name: :xmen, desc: '', type: :integer, default: 0, required: false, mapper: RailsAppGenerator::MapOptionValue) }
      end

      context 'as :boolean' do
        let(:opts) { { name: :xmen, type: :boolean } }

        it { is_expected.to have_attributes(name: :xmen, desc: '', type: :boolean, default: false, required: false, mapper: RailsAppGenerator::MapOptionBooleanFlag) }
      end

      context 'as :array' do
        let(:opts) { { name: :xmen, type: :array } }

        it { is_expected.to have_attributes(name: :xmen, desc: '', type: :array, default: [], required: false, mapper: RailsAppGenerator::MapOptionValue) }
      end

      context 'as :hash' do
        let(:opts) { { name: :xmen, type: :hash } }

        it { is_expected.to have_attributes(name: :xmen, desc: '', type: :hash, default: {}, required: false, mapper: RailsAppGenerator::MapOptionValue) }
      end
    end

    context 'when required is configured' do
      context 'as true' do
        let(:opts) { { name: :xmen, required: true } }

        it { is_expected.to have_attributes(name: :xmen, desc: '', type: :string, default: '', required: true) }
      end

      context 'as false' do
        let(:opts) { { name: :xmen, required: false } }

        it { is_expected.to have_attributes(name: :xmen, desc: '', type: :string, default: '', required: false) }
      end

      context 'when type is mis-configured' do
        let(:opts) { { name: :xmen, type: :integer, required: nil } }

        it { expect { instance }.to raise_error(ArgumentError) }
      end
    end
  end
end
