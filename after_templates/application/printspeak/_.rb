# frozen_string_literal: true

# Description goes here
#
# exe/rag addons/printspeak

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
add_controller('page', 'blog', 'readme', 'about', 'contact', 'faq', 'terms', 'privacy')

route("root 'home#index'")

force_copy

copy_file 'app/controllers/home_controller.rb'            , 'app/controllers/home_controller.rb'
copy_file 'app/views/home/index.html.erb'                 , 'app/views/home/index.html.erb'

copy_file 'app/views/layouts/_alerts.html.erb'            , 'app/views/layouts/_alerts.html.erb'
copy_file 'app/views/layouts/_navbar.html.erb'            , 'app/views/layouts/_navbar.html.erb'
copy_file 'app/views/layouts/_footer.html.erb'            , 'app/views/layouts/_footer.html.erb'
template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

template  'db/seeds.rb'                                   , 'db/seeds.rb'

after_bundle do
  directory "app/assets/images"
  directory "app/assets/stylesheets"
  directory "app/views/page"

  setup_db
end

def setup_db
  add_scaffold('post', 'title', 'body:text')
  add_scaffold('people', 'first_name', 'last_name', 'age:integer', 'address:text')

  db_migrate
end

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
