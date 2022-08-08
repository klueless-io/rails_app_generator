# frozen_string_literal: true

RSpec.describe RailsAppGenerator::RagConfiguration do
  let(:instance) { described_class.new }

  subject { instance }

  describe '#options' do
    subject { instance.options }

    it { is_expected.to be_empty }

    context 'after add_option' do
      before :each do
        instance.add_option(:xmen, type: :integer, default: 53)
      end

      it { is_expected.to include(having_attributes(name: :xmen, type: :integer, default: 53)) }
    end
  end
end
