# frozen_string_literal: true

# Usage:
#
# RailsAppGenerator::Starter.new.start
# RailsAppGenerator::Starter.new(app_path: '.', destination_root: Dir.pwd).start
# RailsAppGenerator::Starter.new(app_path: 'xmen', destination_root: '~/projects_path').start
# RailsAppGenerator::Starter.new(app_path: '.', destination_root: '~/projects_path/xmen').start
RSpec.describe RailsAppGenerator::Starter do
  def sample_path(name)
    File.expand_path("../../../a/#{name}", __dir__)
  end

  let(:instance) { described_class.new(args) }
  let(:app_path) { sample_path('a1') }
  let(:args) { {} }
  let(:opts) { {} }

  let(:dry_run) { true }
  let(:no_dry_run) { false }

  describe 'initialize' do
    describe '.app_path' do
      subject { instance.app_path }

      it { is_expected.to eq('.') }

      context 'when app_path supplied' do
        let(:args) { { app_path: 'xmen'} }

        it { is_expected.to eq('xmen') }
      end
    end

    describe '.destination_root' do
      subject { instance.destination_root }

      it { is_expected.to eq(Dir.pwd) }

      context 'when destination_root supplied' do
        let(:args) { { destination_root: sample_path('a1')} }

        it { 
          is_expected.to eq(sample_path('a1')) }
      end
    end

    describe '.target_path' do
      subject { instance.target_path }

      it { is_expected.to eq(Dir.pwd) }

      context 'when app_path supplied' do
        let(:args) { { app_path: 'xmen'} }

        it { is_expected.to eq(File.join(Dir.pwd, 'xmen')) }
      end

      context 'when destination_root supplied' do
        let(:args) { { destination_root: File.join(Dir.pwd, 'xxx')} }

        it { is_expected.to eq(File.join(Dir.pwd, 'xxx')) }
      end

      context 'when app_path and destination_root supplied' do
        let(:args) { { app_path: 'yyy', destination_root: File.join(Dir.pwd, 'xxx') } }

        it { is_expected.to eq(File.join(Dir.pwd, 'xxx', 'yyy')) }
      end
    end

    describe '.rails_template_path' do
      subject { instance.rails_template_path }

      it { is_expected.to eq(File.join(Gem.loaded_specs['railties'].full_gem_path, 'lib/rails/generators/rails/app/templates')) }

      context 'when rails_template_path supplied' do
        let(:args) { { rails_template_path: '/path_to_rails_template'} }

        it { is_expected.to eq('/path_to_rails_template') }
      end
    end

    describe '.custom_template_path' do
      subject { instance.custom_template_path }

      it { is_expected.to eq(File.join(Gem.loaded_specs['rails_app_generator'].full_gem_path, 'templates')) }

      context 'when custom_template_path supplied' do
        let(:args) { { custom_template_path: '/path_to_custom_template'} }

        it { is_expected.to eq('/path_to_custom_template') }
      end
    end

    # describe '#start' do
    #   let(:destination_root) { sample_path('x1') }

    #   before { FileUtils.rm_rf(instance.destination_root ) }

    #   fit { instance.start }
    # end

    # describe '#start2' do
    #   let(:app_path) { sample_path('xxx3') }

    #   before { FileUtils.rm_rf(instance.destination_root ) }

    #   fit { instance.start2 }
    # end

    # describe '#start3' do
    #   let(:app_path) { sample_path('xxx3') }

    #   before { FileUtils.rm_rf(instance.app_path ) }

    #   fit { instance.start3 }
    # end
  end
end
