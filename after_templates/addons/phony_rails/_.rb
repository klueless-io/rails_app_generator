# frozen_string_literal: true

# This Gem adds useful methods to your Rails app to validate, display and save phone numbers.
#
# exe/rag addons/phony_rails

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

add_controller('home', 'index')

route("root 'home#index'")

force_copy

directory "app/controllers"
directory "app/views/home"
directory "app/views/layouts"
template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
