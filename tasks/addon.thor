# frozen_string_literal: true

# https://codecrate.com/2014/01/replace-rake-with-thor.html

require 'net/http'
require 'json'
require_relative 'gem_info'

# Thor task to create a new AddOn for Rails App Generator
class AddOn < Thor
  include Thor::Actions

  source_root(File.expand_path('../templates/thor_task', File.dirname(__FILE__)))

  GemInfo = Struct.new(:name, :version, :description, keyword_init: true)

  attr_accessor :name
  attr_accessor :addon_config_code

  # method_option :from, :required => true
  desc 'new', 'Create a new Addon for Rails App Generator'
  method_option :gem  , type: :string, default: nil, desc: 'Add required_gem helper to the AddOn. Gem name is looked up to find version and description'
  method_option :force, type: :boolean, default: false, desc: 'Overwrite existing files'
  method_option :depends_on, type: :string, desc: 'This AddOn depends on another AddOn/Gem. active_record is a common dependency'
  def new(name)
    self.name = name

    code = [build_depends_on_code, build_required_gem_code].compact
    code << '' if code.any?
    self.addon_config_code = code.join("\n")

    template('addon/addon', "lib/rails_app_generator/addons/#{name}.rb", force: options[:force])
  end

  no_commands do
    def build_depends_on_code
      return nil unless options[:depends_on]

      "      depends_on :#{options[:depends_on]}"
    end

    def build_required_gem_code
      return nil unless options[:gem]

      gem_name = options[:gem] == 'gem' ? name : options[:gem]

      info = gem_info(gem_name)

      "      required_gem gem.version('#{info.name}', '#{info.version}', '#{info.description}')"
    end

    # example: 'https://rubygems.org/api/v1/gems/draper.json'
    def gem_info(name)
      link = "https://rubygems.org/api/v1/gems/#{name.downcase}.json"
      info = Net::HTTP.get(URI.parse(link))
      json = JSON.parse(info)

      GemInfo.new(
        name: json['name'],
        version: json['version'],
        description: json['info']
      )
    rescue SocketError
      abort 'Internet connection cannot be established to RubyGems.org'
    rescue JSON::ParserError
      abort "Check you have entered the right Gem name\n#{link}"
    end
  end
end
# /Users/davidcruwys/dev/kgems/rails_app_generator/templates/thor/addon
# /Users/davidcruwys/dev/kgems/rails_app_generator/lib/templates/thor
