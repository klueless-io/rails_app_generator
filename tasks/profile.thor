# frozen_string_literal: true

# https://codecrate.com/2014/01/replace-rake-with-thor.html

require 'pry'
# Thor task to create a new Profile for Rails App Generator
class Profile < Thor
  include Thor::Actions

  source_root(File.expand_path('../templates/thor_task', File.dirname(__FILE__)))

  attr_accessor :name

  desc 'new', 'Create a new Profile for testing Rails App Generator settings'
  method_option :variant, type: :string, default: 'default', desc: 'Profile variant to create, valid values are (default, addon)'
  method_option :gem, type: :string, default: nil, desc: 'Gem name is looked up to find version and description'
  method_option :force, type: :boolean, default: false, desc: 'Overwrite existing files'
  def new(name)
    self.name = name

    say "Creating profile #{name}"
    puts "Variant: #{options[:variant]}"

    gi = gem_info
    gi&.debug

    # template('profile/profile', "lib/rails_app_generator/profiles/#{name}.rb", force: options[:force])
  end

  no_commands do
    def gem_info
      return nil unless options[:gem]

      gem_name = options[:gem] == 'gem' ? name : options[:gem]

      GemInfo.create(gem_name)
    end
  end
end
