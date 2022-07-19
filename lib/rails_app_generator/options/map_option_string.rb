# frozen_string_literal: true

module RailsAppGenerator
  # Simple pass through mapper for options that do not yet have a mapper defined
  class MapOptionString < BaseMapOption
    def map(name, value)
      value = value.to_s
      value = "\"#{value}\"" if value.include?(' ')
      "#{option_name(name)}=#{value}"
    end
  end
end
