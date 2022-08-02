# frozen_string_literal: true

# https://codecrate.com/2014/01/replace-rake-with-thor.html

require 'pry'
require_relative 'gem_info'
require 'cmdlet'

# Thor task to create a new Profile for Rails App Generator
class Profile < Thor
  include Thor::Actions

  source_root(File.expand_path('../templates/thor_task', File.dirname(__FILE__)))

  Data = Struct.new(
    :name,
    :name_dash,
    :name_snake,
    :name_human,
    :description,
    :destination_root,
    :template_file,
    keyword_init: true
  )

  attr_accessor :data

  desc 'new', 'Create a new Profile for testing Rails App Generator settings'
  method_option :variant, type: :string, default: 'default', desc: 'Profile variant to create, valid values are (nil, addons)'
  method_option :gem, type: :string, default: nil, desc: 'Gem name is looked up to find version and description'
  method_option :force, type: :boolean, default: false, desc: 'Overwrite existing files'
  # rubocop:disable Metrics/AbcSize
  def new(name)
    @data = build_data(name)

    say "Creating profile #{name}"
    puts "Variant: #{options[:variant]}"

    template('profile/profile.json', profile_path("#{data.name_dash}.json"), force: options[:force])
    template('profile/after_template.rb', after_template_path('_.rb'), force: options[:force])
    template('profile/home/index.html.erb', after_template_path('home/index.html.erb'), force: options[:force])
  end
  # rubocop:enable Metrics/AbcSize

  # rubocop:disable Metrics/BlockLength
  no_commands do
    def human(value)
      Cmdlet::Case::Human.new.call(value)
    end

    def dash(value)
      Cmdlet::Case::Dash.new.call(value)
    end

    def snake(value)
      Cmdlet::Case::Snake.new.call(value)
    end

    def profile_path(file)
      path = 'profiles'
      path = File.join(path, options[:variant]) if options[:variant]
      File.join(path, file)
    end

    def after_template_path(file)
      path = 'after_templates'
      path = File.join(path, options[:variant]) if options[:variant]
      path = File.join(path, data.name_snake)
      File.join(path, file)
    end

    def build_data(name)
      gi = gem_info(name)

      name_dash = dash(name)
      name_snake = snake(name)
      description = gi ? gi.description : 'Description goes here'

      Data.new(
        name: name,
        name_dash: name_dash,
        name_snake: name_snake,
        name_human: human(name_dash),
        description: description,
        destination_root: build_destination_root,
        template_file: build_template_file(name_snake)
      )
    end

    def build_template_file(name_snake)
      path = '~/dev/kgems/rails_app_generator/after_templates/'
      path = File.join(path, options[:variant]) if options[:variant]
      path = File.join(path, "#{name_snake}/_.rb")
      File.expand_path(path)
    end

    def build_destination_root
      # Do not use destination_root as the method name because it already exists on Thor::Actions
      path = '~/dev/kgems/rails_app_generator/a/'
      path = File.join(path, options[:variant]) if options[:variant]
      File.expand_path(path)
    end

    # example: 'https://rubygems.org/api/v1/gems/draper.json'
    def gem_info(name)
      return nil unless options[:gem]

      gem_name = options[:gem] == 'gem' ? name : options[:gem]

      GemInfo.get(gem_name)
    end
  end
  # rubocop:enable Metrics/BlockLength
end
