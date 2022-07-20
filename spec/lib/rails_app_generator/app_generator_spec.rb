# frozen_string_literal: true

RSpec.describe RailsAppGenerator::AppGenerator do
  def sample_path(name)
    File.expand_path("../../../a/#{name}", __dir__)
  end

  let(:instance) { described_class.new(**args) }
  let(:args) { [] }

  # describe '#initialize' do

  # end

  describe '#class << self' do
    describe '#rails_template_path' do
      subject { described_class.rails_template_path }

      it { is_expected.to include('gems/railties').and end_with('lib/rails/generators/rails/app/templates') }

      context 'when rails_template_path supplied' do
        before { described_class.rails_template_path = '/some_path' }

        it { is_expected.to eq('/some_path') }
      end
    end

    describe '#rails_override_template_path' do
      subject { described_class.rails_override_template_path }

      it { is_expected.to end_with('/rails_app_generator/templates') }

      context 'when rails_override_template_path supplied' do
        before { described_class.rails_override_template_path = '/some_path' }

        it { is_expected.to eq('/some_path') }
      end
    end

    # rubocop:disable Lint/InterpolationCheck
    describe '#addon_template_path' do
      subject { described_class.addon_template_path }

      it { is_expected.to end_with('/rails_app_generator/templates/addons/#{addon_name}') }

      context 'when addon_template_path supplied' do
        before { described_class.addon_template_path = '/some_path/#{addon_name}' }

        it { is_expected.to eq('/some_path/#{addon_name}') }
      end
    end
    # rubocop:enable Lint/InterpolationCheck
  end
end
