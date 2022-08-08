# frozen_string_literal: true

RSpec.describe RailsAppGenerator::BuildOption do
  let(:instance) { described_class.new(name, **opts) }
  let(:name) { :xmen }
  let(:opts) { {} }

  describe 'initialize' do
    subject { instance }

    it { is_expected.to be_a described_class }

    context 'when name only' do
      it { is_expected.to have_attributes(name: :xmen, description: '', type: :string, default: '', required: false, mapper: RailsAppGenerator::MapOptionString) }
    end

    context 'when name and description' do
      let(:opts) { { description: 'crazy xmen' } }

      it { is_expected.to have_attributes(name: :xmen, description: 'crazy xmen', type: :string, default: '', required: false, mapper: RailsAppGenerator::MapOptionString) }
    end

    context 'when type is configured' do
      context 'as :integer' do
        let(:opts) { { type: :integer } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :integer, default: 0, required: false, mapper: RailsAppGenerator::MapOptionIgnore) }
      end

      context 'as :boolean' do
        let(:opts) { { type: :boolean } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :boolean, default: false, required: false, mapper: RailsAppGenerator::MapOptionBooleanFlag) }
      end

      context 'as :array' do
        let(:opts) { { type: :array } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :array, default: [], required: false, mapper: RailsAppGenerator::MapOptionIgnore) }
      end

      context 'as :hash' do
        let(:opts) { { type: :hash } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :hash, default: {}, required: false, mapper: RailsAppGenerator::MapOptionIgnore) }
      end
    end

    context 'when required is configured' do
      context 'as true' do
        let(:opts) { { required: true } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :string, default: '', required: true) }
      end

      context 'as false' do
        let(:opts) { { required: false } }

        it { is_expected.to have_attributes(name: :xmen, description: '', type: :string, default: '', required: false) }
      end

      context 'when type is mis-configured' do
        let(:opts) { { type: :integer, required: nil } }

        it { expect { instance }.to raise_error(ArgumentError) }
      end
    end
  end
end
