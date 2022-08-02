# frozen_string_literal: true

# https://codecrate.com/2014/01/replace-rake-with-thor.html

# Thor task to create a new Profile for Rails App Generator
class Profile < Thor
  desc 'new', 'Create a new Profile for testing Rails App Generator settings'
  def new(name)
    # do something here
    puts "new #{name}"
  end
end
