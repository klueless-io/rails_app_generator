# frozen_string_literal: true

# https://codecrate.com/2014/01/replace-rake-with-thor.html

require 'net/http'
require 'json'
require_relative 'gem_info'

# Thor task to create a new Addon for Rails App Generator
class Addon < Thor
  include Thor::Actions

  source_root(File.expand_path('../templates/thor_task', File.dirname(__FILE__)))

  Data = Struct.new(
    :name,
    :name_dash,
    :name_snake,
    :name_human,
    :name_camel,
    :addon_config_code,
    keyword_init: true
  )

  attr_accessor :name
  attr_accessor :data

  # method_option :from, :required => true
  desc 'new', 'Create a new Addon for Rails App Generator'
  method_option :gem  , type: :string, default: nil, desc: 'Add required_gem helper to the Addon. Gem name is looked up to find version and description'
  method_option :force, type: :boolean, default: false, desc: 'Overwrite existing files'
  method_option :depends_on, type: :string, desc: 'This Addon depends on another Addon/Gem. active_record is a common dependency'
  def new(name)
    self.name = snake(name)
    self.data = build_data

    template('addon/addon', "lib/rails_app_generator/addons/#{self.name}.rb", force: options[:force])
  end

  # rubocop:disable Metrics/BlockLength
  no_commands do
    def build_depends_on_code
      return nil unless options[:depends_on]

      "      depends_on :#{options[:depends_on]}"
    end

    def build_required_gem_code
      info = gem_info

      "      required_gem gem.version('#{info.name}', '#{info.version}', '#{info.description}')"
    end

    # example: 'https://rubygems.org/api/v1/gems/draper.json'
    def gem_info
      return nil unless options[:gem]

      gem_name = options[:gem] == 'gem' ? name : options[:gem]

      ::GemInfo.get(gem_name)
    end

    def build_data
      code = [build_depends_on_code, build_required_gem_code].compact
      code << '' if code.any?

      Data.new(
        name: name,
        name_dash: dash(name),
        name_snake: snake(name),
        name_human: human(name),
        name_camel: camel(name),
        addon_config_code: code.join("\n")
      )
    end

    def human(value)
      Cmdlet::Case::Human.new.call(value)
    end

    def dash(value)
      Cmdlet::Case::Dash.new.call(value)
    end

    def snake(value)
      Cmdlet::Case::Snake.new.call(value)
    end

    def camel(value)
      Cmdlet::Case::Camel.new.call(value)
    end
  end
  # rubocop:enable Metrics/BlockLength
end
