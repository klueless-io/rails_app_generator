# frozen_string_literal: true

module RailsAppGenerator
  # Map a boolean true to a command line flag in the format "--flag-name"
  # false is ignored
  class MapOptionBooleanFlag < BaseMapOption
    def map(name, value)
      value == true ? option_name(name) : ''
    end
  end
end
