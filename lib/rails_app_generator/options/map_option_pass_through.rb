# frozen_string_literal: true

module RailsAppGenerator
  # Simple pass through mapper for options that do not yet have a mapper defined
  class MapOptionValue
    def self.map(_name, value)
      value
    end
  end
end
