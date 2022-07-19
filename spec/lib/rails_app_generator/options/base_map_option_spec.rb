# frozen_string_literal: true

RSpec.describe RailsAppGenerator::BaseMapOption do
  describe '#option_name' do
    subject { described_class.new.option_name(name) }

    let(:name) { :skip_git }

    it { is_expected.to eq '--skip-git' }
  end
end
