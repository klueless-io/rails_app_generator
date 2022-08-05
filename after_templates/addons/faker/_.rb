# frozen_string_literal: true

# require 'pry'

# Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
#
# exe/rag addons/faker

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

# Other template command examples
# css_install('tailwind')
# rails_command('db:migrate')
# bundle_add('hotwire-rails')
# rails_command('hotwire:install')
# run('bin/importmap pin sortablejs')
# run('npm install daisyui')
# create_file       'app/assets/stylesheets/custom-bootstrap-import.scss' , read_template('custom-bootstrap-import.scss')
# append_to_file    'app/assets/config/manifest.js'                       , read_template('manifest.js')
# insert_into_file  'app/views/layouts/application.html.erb', read_template('application.html.erb'),
#     before: %(    <%= javascript_include_tag "application", "data-turbo-track": "reload", defer: true %>)
# gsub_file         'app/views/layouts/application.html.erb', %(container mx-auto mt-28 px-5 flex), 'container mx-auto px-5'
# template 'home.css', 'app/assets/stylesheets/home.css'
