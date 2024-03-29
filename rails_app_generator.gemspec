# frozen_string_literal: true

require_relative 'lib/rails_app_generator/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version  = '>= 2.7'
  spec.name                   = 'rails_app_generator'
  spec.version                = RailsAppGenerator::VERSION
  spec.authors                = ['David Cruwys']
  spec.email                  = ['david@ideasmen.com.au']

  spec.summary                = 'Create new Rails Application with custom opinions'
  spec.description            = <<-TEXT
    Create new Rails Application with custom opinions
  TEXT
  spec.homepage               = 'http://appydave.com/gems/rails_app_generator'
  spec.license                = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  # spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri']           = spec.homepage
  spec.metadata['source_code_uri']        = 'https://github.com/klueless-io/rails_app_generator'
  spec.metadata['changelog_uri']          = 'https://github.com/klueless-io/rails_app_generator/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required']  = 'true'

  # The `git ls-files -z` loads the RubyGem files that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  # spec.extensions    = ['ext/rails_app_generator/extconf.rb']

  # spec.add_dependency 'railties', '~> 7' # , ['>= 3.0.0']

  spec.add_dependency 'bootsnap' # used by rails new
  spec.add_dependency 'cssbundling-rails'
  spec.add_dependency 'importmap-rails'
  spec.add_dependency 'jsbundling-rails'
  spec.add_dependency 'rails', '~> 7' # , ['>= 3.0.0']
  spec.add_dependency 'stimulus-rails'
  spec.add_dependency 'tailwindcss-rails'
  spec.add_dependency 'turbo-rails'

  spec.add_dependency 'cmdlet', '~> 0'
  spec.add_dependency 'k_config', '~> 0'
  # spec.add_dependency 'k_type', '~> 0'
  # spec.add_dependency 'k_util', '~> 0'
end
