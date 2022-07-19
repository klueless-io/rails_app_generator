# frozen_string_literal: true

module RailsAppGenerator
  # Map a boolean true to a command line flag in the format "--flag-name"
  # false is ignored
  class MapOptionBooleanFlag
    def self.map(name, value)
      value == true ? "--#{name.to_s.gsub('_', '-')}" : ''
    end
  end
end
