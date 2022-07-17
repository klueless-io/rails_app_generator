# frozen_string_literal: true

RSpec.describe RailsAppGenerator::AppGenerator do
  let(:instance) { described_class.new(**args) }
  let(:args) { {} }

  let(:sample_output_folder1) { File.join(Dir.pwd, 'a', 'sample1') }
  let(:sample_output_folder2) { File.join(Dir.pwd, 'a', 'sample2') }
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

  # describe 'initialize' do
  #   let(:args) { {} }

  #   describe '.output_folder' do
  #     subject { instance.output_folder }

  #     it { is_expected.to eq(Dir.pwd) }

  #     context 'when output_folder supplied' do
  #       let(:args) { { output_folder: sample_output_folder1 } }

  #       it { is_expected.to eq(sample_output_folder1) }
  #     end
  #   end

  #   describe '.dry_run?' do
  #     subject { instance.dry_run? }

  #     it { is_expected.to be_falsey }

  #     context 'when dry_run supplied' do
  #       let(:args) { { dry_run: dry_run } }

  #       it { is_expected.to be_truthy }
  #     end
  #   end
  # end

  # describe '#dry_runner' do
  #   subject { instance.dry_run_info }

  #   before { instance.start }

  #   let(:args) { { output_folder: sample_output_folder1, dry_run: dry_run } }

  #   it { subject }
  # end

  # # describe '#start' do
  # #   let(:args) { { output_folder: sample_output_folder } }

  # #   xit {
  # #     instance.run_rails_generator1
  # #     instance.run_rails_generator2
  # #   }
  # # end

  # describe '#run_rails_generator1' do
  #   let(:args) { { output_folder: sample_output_folder1 } }

  #   it { instance.run_rails_generator1 }
  # end

  # describe '#run_rails_generator2' do
  #   let(:args) { { output_folder: sample_output_folder2 } }

  #   fit { instance.run_rails_generator2 }
  # end
end
