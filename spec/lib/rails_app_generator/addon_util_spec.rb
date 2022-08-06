# frozen_string_literal: true

RSpec.describe RailsAppGenerator::AddonUtil do
  describe '#classes' do
    subject { described_class.classes }

    it { is_expected.to include(RailsAppGenerator::AddOns::Annotate) }
  end

  describe '#get' do
    subject { described_class.get(addon) }

    context 'when addon is annotate' do
      let(:addon) { :annotate }

      it { is_expected.to eq(RailsAppGenerator::AddOns::Annotate) }
    end

    context 'when addon is invalid' do
      let(:addon) { :invalid }

      it { expect { subject }.to raise_error(NameError) }
    end
  end
end
