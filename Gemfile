# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :development, :test do
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rake'
  gem 'rake-compiler', require: false
  gem 'rspec', '~> 3.0'
  gem 'rubocop'
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'simplecov', require: false
end

gem 'ruby-lsp', '~> 0.2.2', group: :development
