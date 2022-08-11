# frozen_string_literal: true

# A fast, safe and extensible Markdown to (X)HTML parser
#
# exe/rag addons/redcarpet

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

bundle_install

add_controller('home', 'index')

route("root 'home#index'")

force_copy

directory "app/controllers"
directory "app/views/home"
directory "app/views/layouts"
template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
