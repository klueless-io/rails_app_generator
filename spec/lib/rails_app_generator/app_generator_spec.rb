# frozen_string_literal: true

RSpec.describe RailsAppGenerator::AppGenerator do
  let(:instance) { described_class.new(**args) }
  let(:args) { { output_folder: '~/dev/kweb/xmen' } }
  # subject { instance.name }

  # it {
  #   gem_path = Gem.loaded_specs["railties"].full_gem_path
  #   # lib/rails/generators/rails/app/templates
  #   templates_root = File.expand_path(File.join(gem_path, "lib/rails/generators/rails/app/templates"))

  #   described_class.source_root templates_root
  #   # destination_root = "/Users/davidcruwys/dev/kweb/xmen"
  #   destination_root = "/Users/davidcruwys/dev/kgems/rails_app_generator/a/sample1"
  #   described_class.start [destination_root, '--skip-bundle']
  # }

  describe 'initialize' do
    let(:args) { {} }

    describe '.output_folder' do
      subject { instance.output_folder }

      it { is_expected.to eq(Dir.pwd) }
    end
  end
end
