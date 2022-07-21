# frozen_string_literal: true

RSpec.describe RailsAppGenerator::MapOptionString do
  describe '#map' do
    subject { described_class.new.map(name, value) }

    let(:name) { :project_name }

    context 'simple string values' do
      let(:value) { 'my-project' }

      it { is_expected.to eq('--project-name=my-project') }
    end

    context 'string value with whitespace' do
      let(:value) { 'my project' }

      it { is_expected.to eq('--project-name="my project"') }
    end

    context 'nil value' do
      let(:value) { nil }

      it { is_expected.to be_empty }
    end

    context 'blank value' do
      let(:value) { '' }

      it { is_expected.to be_empty }
    end
  end
end
