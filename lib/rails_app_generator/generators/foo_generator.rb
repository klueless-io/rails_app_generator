# frozen_string_literal: true

require_relative 'base'

# Some comment
module RailsAppGenerator
  # xxx
  class FooGenerator < Generators::Base
    def bundler_audit_gem
      puts '11111111111'
    end

    def rake_task
      puts '22222222222'
    end
  end
end
