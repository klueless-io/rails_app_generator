# frozen_string_literal: true

RSpec.describe RailsAppGenerator::Cli do
  let(:instance) { described_class.new }

  context 'initialize' do
    it { is_expected.to be_a_kind_of(described_class) }
  end

  context 'start' do
    let(:instance) { described_class.start }

    it { is_expected.to be_a_kind_of(described_class) }
  end
end
