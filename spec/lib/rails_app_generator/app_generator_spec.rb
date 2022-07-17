# frozen_string_literal: true

RSpec.describe RailsAppGenerator::AppGenerator do
  let(:instance) { described_class.new }#(**args) }
  let(:args) { { output_folder: '~/dev/kweb/xmen' } }
  # subject { instance.name }

  it {
    gem_path = Gem.loaded_specs["railties"].full_gem_path
    # lib/rails/generators/rails/app/templates
    templates_root = File.expand_path(File.join(gem_path, "lib/rails/generators/rails/app/templates"))

    described_class.source_root templates_root

    described_class.start ['x', '--skip-bundle']
  }
end
