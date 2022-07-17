# frozen_string_literal: true

require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  class AppGenerator < Rails::Generators::AppGenerator
    attr_reader :output_folder

    def initialize(*args) #@, **opts)
      # @output_folder = opts[:output_folder]
      super(*args) # , **opts)

      gem_path = Gem.loaded_specs["railties"].full_gem_path
    end
  end
end