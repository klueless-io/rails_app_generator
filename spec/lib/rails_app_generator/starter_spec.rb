# frozen_string_literal: true

# Usage:
#
# RailsAppGenerator::Starter.new.start
# RailsAppGenerator::Starter.new(app_path: '.', destination_root: Dir.pwd).start
# RailsAppGenerator::Starter.new(app_path: 'xmen', destination_root: '~/projects_path').start
# RailsAppGenerator::Starter.new(app_path: '.', destination_root: '~/projects_path/xmen').start
RSpec.describe RailsAppGenerator::Starter do
  include_context :use_temp_folder

  def sample_path(name)
    File.expand_path("../../../a/#{name}", __dir__)
  end

  let(:instance) { described_class.new(**args) }
  let(:app_path) { sample_path('a1') }
  let(:args) { {} }
  let(:opts) { {} }
  let(:rails_options) { RailsAppGenerator::RailsOptions.new(**opts) }

  let(:dry_run) { true }
  let(:no_dry_run) { false }

  # it {
  #   require 'rails_app_generator'

  #   app_path = 'rag_standard'
  #   # kweb_path = '/Users/davidcruwys/dev/kweb'
  #   rag_path = '/Users/davidcruwys/dev/kgems/rails_app_generator/a'

  #   args = {
  #     app_path: app_path,
  #     destination_root: rag_path
  #   }
  #   opts = {
  #     # skip_git: true,
  #     skip_bundle: false,
  #     test: 'minitest'
  #     # css: 'bootstrap'
  #   }

  #   instance = RailsAppGenerator::Starter.new(args)
  #   FileUtils.rm_rf(instance.target_path)

  #   rails_options = RailsAppGenerator::RailsOptions.new(opts)
  #   rails_options.debug
  #   instance.start(rails_options)
  # }
  # it do
  #   # p1 = '/Users/davidcruwys/dev/kgems/rails_app_generator/a/rails_standard'
  #   # p2 = '/Users/davidcruwys/dev/kgems/rails_app_generator/a/rag_standard'

  #   p1 = '/Users/davidcruwys/dev/kgems/rails_app_generator/a/rag_standard'
  #   p2 = '/Users/davidcruwys/dev/kgems/rails_app_generator/a/rag_bootstrap'

  #   diff = ProjectDiff.new(p1, p2)
  #   diff.debug
  #   diff.vscode_compare_files
  # end

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

      context 'when rails_template_path supplied' do
        let(:args) { { rails_template_path: '/path_to_rails_template' } }

        it { is_expected.to eq('/path_to_rails_template') }
      end
    end

    describe '.override_template_path' do
      subject { instance.override_template_path }

      it { is_expected.to eq(RailsAppGenerator::AppGenerator.override_template_path) }

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

    describe '.when_folder_exist' do
      subject { instance.when_folder_exist }

      it { is_expected.to eq('abort') }

      context 'when addon_template_path supplied' do
        let(:args) { { when_folder_exist: 'destroy' } }

        it { is_expected.to eq('destroy') }
      end
    end
  end

  describe '#handle_target_folder_found?' do
    subject { instance.handle_target_folder_found? }

    let(:args) { { destination_root: temp_folder, app_path: 'my_cool_app', when_folder_exist: action } }
    let(:action) { 'abort' }

    let(:app_folder) { File.join(temp_folder, 'my_cool_app') }
    let(:app_folder_deep) { File.join(app_folder, 'app', 'controller') }
    let(:git_folder) { File.join(app_folder, '.git') }
    let(:code_file) { File.join(app_folder, 'code_file.rb') }
    let(:code_file_deep) { File.join(app_folder_deep, 'code_file.rb') }
    let(:git_file) { File.join(git_folder, 'some_file.txt') }

    context 'when target folder does not exist' do
      it { is_expected.to eq(true) }
    end

    context 'when target folder exists' do
      before do
        FileUtils.mkdir_p(git_folder)
        FileUtils.mkdir_p(app_folder_deep)
        File.write(git_file, 'content of a file in git folder')
        File.write(code_file, 'content of a file in code folder')
        File.write(code_file_deep, 'content of a file in nested code folder')
      end

      context 'when when_folder_exist is abort' do
        it do
          is_expected.to eq(false)

          expect(File.directory?(app_folder)).to eq(true)
          expect(File.exist?(code_file)).to eq(true)
          expect(File.exist?(code_file_deep)).to eq(true)
          expect(File.exist?(git_file)).to eq(true)
        end
      end

      context 'when when_folder_exist is destroy' do
        let(:action) { 'destroy' }

        it do
          is_expected.to eq(true)

          expect(File.directory?(app_folder)).to eq(false)
          expect(File.exist?(code_file)).to eq(false)
          expect(File.exist?(code_file_deep)).to eq(false)
          expect(File.exist?(git_file)).to eq(false)
        end
      end

      context 'when when_folder_exist is keep_git' do
        let(:action) { 'keep_git' }

        it do
          is_expected.to eq(true)

          expect(File.directory?(app_folder)).to eq(true)
          expect(File.exist?(code_file)).to eq(false)
          expect(File.exist?(code_file_deep)).to eq(false)
          expect(File.exist?(git_file)).to eq(true)
        end
      end

      context 'when when_folder_exist is overwrite' do
        let(:action) { 'overwrite' }

        it do
          is_expected.to eq(true)

          expect(File.directory?(app_folder)).to eq(true)
          expect(File.exist?(code_file)).to eq(true)
          expect(File.exist?(code_file_deep)).to eq(true)
          expect(File.exist?(git_file)).to eq(true)
        end
      end
    end
  end

  context 'when executing the generator' do
    subject { instance.start }

    let(:args) { { destination_root: sample_path('rag_standard') } }
    let(:opts) do
      {
        skip_git: true,
        skip_bundle: true

        # # new addon options
        # add_irbrc: false,
        # add_foreman: false,
        # add_dotenv: false,
        # add_docker: false,
        # add_docker_compose: false,
        # add_rubocop: false

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

    # describe '#kw01_bootstrap' do
    #   let(:args) do
    #     {
    #       app_path: 'kw01_bootstrap',
    #       destination_root: '/Users/davidcruwys/dev/kweb'
    #     }
    #   end
    #   let(:opts) do
    #     {
    #       skip_git: true,
    #       skip_bundle: false
    #       # css: 'bootstrap'
    #     }
    #   end

    #   before { FileUtils.rm_rf(instance.target_path) }

    #   xit do
    #     instance.start(rails_options)

    #     system 'gem env'

    #     console_output_file = File.expand_path('../../../lib/rails_app_generator/notes/kw01.txt', File.join(File.dirname(__FILE__)))

    #     File.write(console_output_file, instance.console_output.split("\n").compact.collect(&:strip).join("\n"))
    #   end
    # end
  end
end
