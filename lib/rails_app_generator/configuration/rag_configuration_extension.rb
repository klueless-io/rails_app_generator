# frozen_string_literal: true

module RailsAppGenerator
  # Register this configuration access extension for Rag configuration
  module RagConfigurationExtension
    def rag
      return @rag if defined? @rag

      @rag = RagConfiguration.new
    end
  end
end

KConfig::Configuration.register(:rag, RailsAppGenerator::RagConfigurationExtension)
