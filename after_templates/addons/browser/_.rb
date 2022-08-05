# frozen_string_literal: true

# require 'pry'

# Do some browser detection with Ruby.
#
# exe/rag addons/browser

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

force_copy

copy_file 'app/controllers/home_controller.rb'            , 'app/controllers/home_controller.rb'
copy_file 'app/views/home/index.html.erb'                 , 'app/views/home/index.html.erb'

