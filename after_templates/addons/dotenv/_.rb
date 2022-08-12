# frozen_string_literal: true

# Loads environment variables from `.env`.
#
# exe/rag addons/dotenv

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

add_controller('home', 'index')
route("root 'home#index'")

force_copy

copy_file 'app/controllers/home_controller.rb'            , 'app/controllers/home_controller.rb'
copy_file 'app/views/home/index.html.erb'                 , 'app/views/home/index.html.erb'

template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

template  'db/seeds.rb'                                   , 'db/seeds.rb'
