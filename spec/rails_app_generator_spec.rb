# frozen_string_literal: true

RSpec.describe RailsAppGenerator do
  it 'has a version number' do
    expect(RailsAppGenerator::VERSION).not_to be nil
  end

  it 'has a standard error' do
    expect { raise RailsAppGenerator::Error, 'some message' }
      .to raise_error('some message')
  end
end
