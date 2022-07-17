# frozen_string_literal: true

RSpec.describe RailsAppGenerator::Starter do
  def sample_path(name)
    File.join(Dir.pwd, 'a', name)
  end

  let(:instance) { described_class.new(app_path, **opts) }
  let(:app_path) { sample_path('a1') }
  let(:opts) { {} }

  let(:dry_run) { true }
  let(:no_dry_run) { false }

  # subject { instance.name }

  # it {
  #   gem_path = Gem.loaded_specs["railties"].full_gem_path
  #   # lib/rails/generators/rails/app/templates
  #   templates_root = File.expand_path(File.join(gem_path, "lib/rails/generators/rails/app/templates"))

  #   described_class.source_root templates_root
  #   # destination_root = "/Users/davidcruwys/dev/kweb/xmen"
  #   destination_root = "/Users/davidcruwys/dev/kgems/rails_app_generator/a/sample"
  #   described_class.start [destination_root, '--skip-bundle']
  # }

  describe 'initialize' do
    let(:opts) { {} }

    describe '.app_path' do
      subject { instance.app_path }

      context 'when app_path supplied' do
        it { is_expected.to eq(sample_path('a1')) }
      end

      context 'when app_path not supplied' do
        let(:instance) { described_class.new }

        it { is_expected.to eq(Dir.pwd) }
      end
    end

    describe '.rails_template_path' do
      subject { instance.rails_template_path }

      it { is_expected.to eq(File.join(Gem.loaded_specs['railties'].full_gem_path, 'lib/rails/generators/rails/app/templates')) }
    end

    describe '.custom_template_path' do
      subject { instance.custom_template_path }

      it { is_expected.to eq(File.join(Gem.loaded_specs['rails_app_generator'].full_gem_path, 'templates')) }
      # it { is_expected.to eq(File.expand_path(File.join(__dir__, '../../../templates'))) }
    end

    describe '.template_paths' do
      subject { instance.template_paths }

      it { is_expected.to eq([instance.rails_template_path, instance.custom_template_path]) }
    end
  end
end
