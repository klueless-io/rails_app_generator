# frozen_string_literal: true

# require 'pry'

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
#
# exe/rag addons/mini_magick

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

force_copy

copy_file 'app/controllers/home_controller.rb'            , 'app/controllers/home_controller.rb'
copy_file 'app/views/home/index.html.erb'                 , 'app/views/home/index.html.erb'

copy_file 'app/views/layouts/_alerts.html.erb'            , 'app/views/layouts/_alerts.html.erb'
copy_file 'app/views/layouts/_navbar.html.erb'            , 'app/views/layouts/_navbar.html.erb'
copy_file 'app/views/layouts/_footer.html.erb'            , 'app/views/layouts/_footer.html.erb'
template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

copy_file 'app/assets/images/cat1.jpg'                           , 'app/assets/images/cat1.jpg'
copy_file 'app/assets/images/cat2.jpg'                           , 'app/assets/images/cat2.jpg'
copy_file 'app/assets/images/cat3.jpg'                           , 'app/assets/images/cat3.jpg'
