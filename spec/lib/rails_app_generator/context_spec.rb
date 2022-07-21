# frozen_string_literal: true

RSpec.describe RailsAppGenerator::Context do
  let(:instance) do
    described_class.new(
      rails_template_path,
      rails_override_template_path,
      addon_template_path,
      options
    )
  end

  let(:rails_template_path) { '/rails_template_path' }
  let(:rails_override_template_path) { '/rails_override_template_path' }
  let(:addon_template_path) { '/addon_template_path' }
  let(:options) { { a: 111, b: 222 } }

  # describe '#debug' do
  #   fit { instance.debug }
  # end

  describe '#initialize' do
    describe '#rails_template_path' do
      subject { instance.rails_template_path }

      it { is_expected.to eq(rails_template_path) }
    end

    describe '#rails_override_template_path' do
      subject { instance.rails_override_template_path }

      it { is_expected.to eq(rails_override_template_path) }
    end

    describe '#addon_template_path' do
      subject { instance.addon_template_path }

      it { is_expected.to eq(addon_template_path) }
    end

    describe '#options' do
      subject { instance.options }

      it { is_expected.to eq(options) }
    end
  end

  describe '#addons' do
    subject { instance.addons }

    it { is_expected.to include('rails_app_generator/add_ons/docker').and include('rails_app_generator/add_ons/rubocop') }
  end

  describe '#default_addons' do
    subject { instance.default_addons }

    it { is_expected.to include(:action_mailer).and include(:active_record) }
  end
end
