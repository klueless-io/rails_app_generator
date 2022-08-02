# frozen_string_literal: true

# source: https://stephenagrice.medium.com/making-a-command-line-ruby-gem-write-build-and-push-aec24c6c49eb

GEM_NAME = 'rails_app_generator'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rails_app_generator/version'

require 'pry'

RSpec::Core::RakeTask.new(:spec)

require 'rake/extensiontask'

desc 'Compile all the extensions'
task build: :compile

Rake::ExtensionTask.new('rails_app_generator') do |ext|
  ext.lib_dir = 'lib/rails_app_generator'
end

desc 'Publish the gem to RubyGems.org'
task :publish do
  version = RailsAppGenerator::VERSION
  system 'gem build'
  system "gem push #{GEM_NAME}-#{version}.gem"
end

desc 'Remove old *.gem files'
task :clean do
  system 'rm *.gem'
end

task default: %i[clobber compile spec]
