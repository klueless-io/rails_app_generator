# frozen_string_literal: true

# require 'pry'

# HexaPDF is a pure Ruby library with an accompanying application for working with PDF files.

#
# exe/rag addons/hexapdf

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")
route("get 'home/make_pdf'")

force_copy

copy_file 'app/controllers/home_controller.rb'            , 'app/controllers/home_controller.rb'
copy_file 'app/views/home/index.html.erb'                 , 'app/views/home/index.html.erb'

copy_file 'app/views/layouts/_alerts.html.erb'            , 'app/views/layouts/_alerts.html.erb'
copy_file 'app/views/layouts/_navbar.html.erb'            , 'app/views/layouts/_navbar.html.erb'
copy_file 'app/views/layouts/_footer.html.erb'            , 'app/views/layouts/_footer.html.erb'
template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
