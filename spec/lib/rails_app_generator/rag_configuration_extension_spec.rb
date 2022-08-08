# frozen_string_literal: true

RSpec.describe RailsAppGenerator::RagConfigurationExtension do
  let(:cfg) { ->(config) {} }

  let(:instance) { KConfig.configuration }

  before :each do
    KConfig.configure(&cfg)
  end
  after :each do
    KConfig.reset
  end

  context 'sample usage' do
    subject { instance.rag.options }

    let(:cfg) do
      lambda do |config|
        config.rag.add_option(:xmen, type: :integer, default: 53)
      end
    end

    it do
      is_expected.to include(having_attributes(name: :xmen, type: :integer, default: 53))
    end
  end
end
