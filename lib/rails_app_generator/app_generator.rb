# frozen_string_literal: true

require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  < Rails::Generators::AppGenerator
  class AppGenerator
    attr_reader :output_folder

    def initialize(**args)
      @output_folder = args[:output_folder] || Dir.pwd
    end

    # def initialize(*args, **opts) #@, **opts)
    #   # @output_folder = opts[:output_folder]
    #   super(*args) # , **opts)

    #   gem_path = Gem.loaded_specs["railties"].full_gem_path
    # end
  end
end
