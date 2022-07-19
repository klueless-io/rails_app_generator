# frozen_string_literal: true

module RailsAppGenerator
  # Simple pass through mapper for options that do not yet have a mapper defined
  class MapOptionIgnore < BaseMapOption
    def map(_name, _value)
      nil
    end
  end
end
