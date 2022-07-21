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
  let(:rails_options) { RailsAppGenerator::RailsOptions.new(opts) }

  let(:dry_run) { true }
  let(:no_dry_run) { false }

  describe 'initialize' do
    describe '.app_path' do
      subject { instance.app_path }
      it { is_expected.to eq('.') }

      context 'when app_path supplied' do
        let(:args) { { app_path: 'xmen' } }

        it { is_expected.to eq('xmen') }
      end
    end

    describe '.destination_root' do
      subject { instance.destination_root }

      it { is_expected.to eq(Dir.pwd) }

      context 'when destination_root supplied' do
        let(:args) { { destination_root: sample_path('a1') } }

        it {
          is_expected.to eq(sample_path('a1'))
        }
      end
    end

    describe '.target_path' do
      subject { instance.target_path }

      it { is_expected.to eq(Dir.pwd) }

      context 'when app_path supplied' do
        let(:args) { { app_path: 'xmen' } }

        it { is_expected.to eq(File.join(Dir.pwd, 'xmen')) }
      end

      context 'when destination_root supplied' do
        let(:args) { { destination_root: File.join(Dir.pwd, 'xxx') } }

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
        let(:args) { { rails_template_path: '/path_to_rails_template' } }

        it { is_expected.to eq('/path_to_rails_template') }
      end
    end

    describe '.override_template_path' do
      subject { instance.override_template_path }

      it { is_expected.to eq(File.join(Gem.loaded_specs['rails_app_generator'].full_gem_path, 'templates')) }

      context 'when override_template_path supplied' do
        let(:args) { { override_template_path: '/path_to_custom_template' } }

        it { is_expected.to eq('/path_to_custom_template') }
      end
    end

    describe '.addon_template_path' do
      subject { instance.addon_template_path }

      it { is_expected.to eq(RailsAppGenerator::AppGenerator.addon_template_path) }

      context 'when addon_template_path supplied' do
        let(:args) { { addon_template_path: '/path_to_custom_template' } }

        it { is_expected.to eq('/path_to_custom_template') }
      end
    end

    context 'when executing the generator' do
      subject { instance.start }

      let(:args) { { destination_root: sample_path('x1') } }
      let(:opts) do
        {
          skip_git: true,
          skip_bundle: true,

          # new addon options
          add_irbrc: false,
          add_foreman: false,
          add_dotenv: false,
          add_docker: false,
          add_docker_compose: false,
          add_rubocop: false

          # new addon options after finish
          # add_annotate: false,
          # add_continuous_integration: false,
          # add_high_voltage: false,
          # add_generators: false,
          # add_lograge: false,
          # add_pundit: false,
          # add_services: false,
          # add_sidekiq: false,
          # add_views: false,
          # add_factory_bot: false,
          # add_shoulda: false

          # test: 'rspec'

        }
      end

      # describe '.console_output' do
      #   subject { instance.console_output }

      #   it { is_expected.to be_nil }

      #   context 'when console_output is written too' do
      #     before do
      #       FileUtils.rm_rf(instance.target_path)
      #       instance.start(rails_options)
      #     end

      #     it { is_expected.not_to be_empty }
      #   end
      # end

      # describe '#start' do
      #   before { FileUtils.rm_rf(instance.target_path) }

      #   it do
      #     instance.start(rails_options)

      #     console_output_file = File.expand_path('../../../lib/rails_app_generator/notes/a2.txt', File.join(File.dirname(__FILE__)))

      #     File.write(console_output_file, instance.console_output.split("\n").compact.collect(&:strip).join("\n"))
      #   end
      # end
    end
  end
end
