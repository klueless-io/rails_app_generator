# frozen_string_literal: true

RSpec.describe RailsAppGenerator::MapOptionValue do
  describe '#map' do
    subject { described_class.map(name, value) }

    let(:name) { :skip_git }

    context 'value passes through' do
      let(:value) { 'blah-blah' }

      it { is_expected.to eq 'blah-blah' }
    end
  end
end
