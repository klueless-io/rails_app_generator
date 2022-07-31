# frozen_string_literal: true

module RailsAppGenerator
  #  Formatted Gem Entry allows some control over gem entries into the Gemfile
  class FormattedGemEntry < Rails::Generators::AppBase::GemfileEntry
    def to_s
      return "\n#{super}" if comment

      super
    end
  end
end
