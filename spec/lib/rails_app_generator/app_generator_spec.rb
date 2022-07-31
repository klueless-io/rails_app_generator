# frozen_string_literal: true

RSpec.describe RailsAppGenerator::AppGenerator do
  def sample_path(name)
    File.expand_path("../../../a/#{name}", __dir__)
  end

  let(:instance) { described_class.new(**args) }
  let(:args) { [] }

  describe '#class << self' do
    describe '#rails_template_path' do
      subject { described_class.rails_template_path }

      it { is_expected.to include('gems/railties').and end_with('lib/rails/generators/rails/app/templates') }

      context 'when rails_template_path supplied' do
        before { described_class.rails_template_path = '/some_path' }

        it { is_expected.to eq('/some_path') }
      end
    end

    describe '#override_template_path' do
      subject { described_class.override_template_path }

      it { is_expected.to end_with('/rails_app_generator/templates') }

      context 'when override_template_path supplied' do
        before { described_class.override_template_path = '/some_path' }

        it { is_expected.to eq('/some_path') }
      end
    end

    describe '#addon_template_path' do
      subject { described_class.addon_template_path }

      it { is_expected.to end_with('/rails_app_generator/templates/addons/%<addon>s') }

      context 'when addon_template_path supplied' do
        before { described_class.addon_template_path = '/some_path/%<addon>s' }

        it { is_expected.to eq('/some_path/%<addon>s') }
      end
    end
  end

  # it do
  #   app_path          = 'sample'
  #   addon             = 'annotate'
  #   destination_root  = '/Users/davidcruwys/dev/kgems/rails_app_generator/a/rag'

  #   opts = ['--skip-git', '--skip-bundle']
  #   # opts << '--pretend'
  #   opts << "--add-#{addon}"

  #   starter = RailsAppGenerator::Starter.new(app_path: app_path, destination_root: destination_root, capture_output: false)
  #   starter.delete_target_folder
  #   starter.start(opts)
  # end
end
