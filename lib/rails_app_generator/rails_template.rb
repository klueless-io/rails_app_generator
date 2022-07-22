# frozen_string_literal: true

# require 'rails/generators/rails/app/app_generator'

module RailsAppGenerator
  #  RailsTemplate can be used when working with the --template option
  class RailsTemplate
    attr_reader :host

    def initialize(host)
      binding.pry
      @host = host
    end
    
    def fuck
      puts 'fuck'
    end
  end
end
