# frozen_string_literal: true

# Rails 7 using Tailwind CSS and Reusable Styles

require 'pry'

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index', 'bootstrap', 'tailwind')
route("root 'home#index'")

css_install('tailwind')
css_install('bootstrap')

force_copy

copy_file   'home/index.html.erb'       , 'app/views/home/index.html.erb'
copy_file   'home/bootstrap.html.erb'   , 'app/views/home/bootstrap.html.erb'
copy_file   'home/tailwind.html.erb'    , 'app/views/home/tailwind.html.erb'
copy_file   'home/_example.html.erb'    , 'app/views/home/_example.html.erb'
copy_file   'home/home_controller.rb'   , 'app/controllers/home_controller.rb'

copy_file   'application.html.erb'      , 'app/views/layouts/application.html.erb'
copy_file   'application_controller.rb' , 'app/controllers/application_controller.rb'
copy_file   'application.tailwind.css'  , 'app/assets/stylesheets/application.tailwind.css'
copy_file   'Procfile.dev'              , 'Procfile.dev'

replacement_script = <<-JSON
    "build:css_bootstrap": "sass ./app/assets/stylesheets/application.bootstrap.scss:./app/assets/builds/application_bootstrap.css --no-source-map --load-path=node_modules",
    "build:css_tailwind": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application_tailwind.css --minify"
JSON

gsub_file   'package.json', /^(.*?)"build:css"(.*?)$/, replacement_script


