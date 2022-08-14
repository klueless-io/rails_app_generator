# frozen_string_literal: true

RSpec.describe RailsAppGenerator::Addon do
  let(:instance) { described_class.new(context) }

  let(:context) do
    RailsAppGenerator::Context.new(
      rails_template_path,
      rails_override_template_path,
      addon_template_path,
      options
    )
  end

  let(:rails_template_path) { '/rails_template_path' }
  let(:rails_override_template_path) { '/rails_override_template_path' }
  let(:addon_template_path) { '/addon_template_path' }
  let(:options) { {} }

  describe '#initialize' do
    subject { instance }
    it { is_expected.to be_a(described_class) }
  end

  context 'class helpers' do
    describe '#addon_name' do
      subject { described_class.addon_name }

      it { is_expected.to eq(:addon) }

      context 'when custom addon' do
        subject { RailsAppGenerator::AddOns::ActsAsList.addon_name }

        it { is_expected.to eq(:acts_as_list) }
      end
    end

    describe '#gem_entries' do
      subject { described_class.gem_entries }

      let(:gem1) { described_class.gem.new('abc', '1.2.3', 'gem description') }
      let(:gem2) { described_class.gem.new('abc', '1.2.4', 'gem description is different') }

      it { is_expected.to be_empty }

      describe '#required_gem' do
        context 'when gem is required' do
          before do
            described_class.reset_gem_entries
            described_class.send(:required_gem, gem1)
          end

          it do
            expect(subject.count).to eq(1)
            expect(subject.first).to have_attributes(name: 'abc', version: '1.2.3', comment: 'gem description')
          end
        end

        context 'when same gem is required twice in low to high version order' do
          before do
            described_class.reset_gem_entries
            described_class.send(:required_gem, gem1)
            described_class.send(:required_gem, gem2)
          end

          it do
            expect(subject.count).to eq(1)
            expect(subject.first).to have_attributes(name: 'abc', version: '1.2.4', comment: 'gem description is different')
          end
        end

        context 'when same gem is required twice in high to low version order' do
          before do
            described_class.reset_gem_entries
            described_class.required_gem(gem2)
            described_class.required_gem(gem1)
          end

          it do
            expect(subject.count).to eq(1)
            expect(subject.first).to have_attributes(name: 'abc', version: '1.2.4', comment: 'gem description is different')
          end
        end
      end
    end
  end
end
