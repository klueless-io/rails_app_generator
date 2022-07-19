# frozen_string_literal: true

module RailsAppGenerator
  # Simple pass through mapper for options that do not yet have a mapper defined
  class BaseMapOption
    def option_name(name)
      "--#{name.to_s.gsub('_', '-')}"
    end
  end
end
