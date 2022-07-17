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

      it { is_expected.to eq(Rails::Generators::AppGenerator.source_root) }
    end

    describe '.custom_template_path' do
      subject { instance.custom_template_path }

      it { is_expected.to eq(File.expand_path(File.join(__dir__, '../../../templates'))) }
    end

    # describe '.dry_run?' do
    #   subject { instance.dry_run? }

    #   it { is_expected.to be_falsey }

    #   context 'when dry_run supplied' do
    #     let(:opts) { { dry_run: dry_run } }

    #     it { is_expected.to be_truthy }
    #   end
    # end
  end

  # fdescribe '#dry_runner' do
  #   subject { instance.dry_run_info }

  #   before { instance.start }

  #   let(:opts) { { app_path: sample_app_path1, dry_run: dry_run } }

  #   it { subject }
  # end

  # describe '#start' do
  #   let(:opts) { { app_path: sample_app_path } }

  #   xit {
  #     instance.run_rails_generator1
  #     instance.run_rails_generator2
  #   }
  # end

  # describe '#run_rails_generator1' do
  #   let(:opts) { { app_path: sample_app_path1 } }

  #   it { instance.run_rails_generator1 }
  # end

  # describe '#run_rails_generator2' do
  #   let(:opts) { { app_path: sample_app_path2 } }

  #   it { instance.run_rails_generator2 }
  # end
end
