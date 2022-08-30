# frozen_string_literal: true

# Retrieve GemInfo from RubyGems.org
module RailsAppGenerator
  # GemQuery queries RubyGems for GemEntry.
  class GemQuery
    class << self
      def get(name)
        gem_info = query_ruby_gems(name)

        return gem_info if gem_info

        return query_ruby_gems(name.gsub('_', '-')) if name.include?('_')
        return query_ruby_gems(name.gsub('-', '_')) if name.include?('-')

        abort "Cannot find GEM (#{name}) on RubyGems.org"
      end

      private

      def query_ruby_gems(name)
        link = "https://rubygems.org/api/v1/gems/#{name.downcase}.json"
        info = Net::HTTP.get(URI.parse(link))
        json = JSON.parse(info)

        comment = (json['description'] || json['info'] || '').gsub(/(\r?\n|\r)/, ' ').squeeze.strip

        Rails::Generators::AppBase::GemfileEntry.new(json['name'], json['version'], comment)
      rescue SocketError
        abort 'Internet connection cannot be established to RubyGems.org'
      rescue JSON::ParserError
        nil
      end
    end
  end
end
