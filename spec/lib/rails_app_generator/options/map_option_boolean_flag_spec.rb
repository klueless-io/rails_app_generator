# frozen_string_literal: true

RSpec.describe RailsAppGenerator::MapOptionBooleanFlag do
  describe '#map' do
    subject { described_class.map(name, value) }

    let(:name) { :skip_git }

    context 'when flag is true' do
      let(:value) { true }

      it { is_expected.to eq '--skip-git' }
    end

    context 'when flag is false' do
      let(:value) { false }

      it { is_expected.to eq '' }
    end
  end
end
