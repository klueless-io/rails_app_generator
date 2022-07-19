# frozen_string_literal: true

RSpec.describe RailsAppGenerator::MapOptionIgnore do
  describe '#map' do
    subject { described_class.new.map(name, value) }

    let(:name) { :skip_git }

    context 'all values becomes null' do
      let(:value) { 'blah-blah' }

      it { is_expected.to be_nil }
    end
  end
end
