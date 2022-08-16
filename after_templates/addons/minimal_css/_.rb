# frozen_string_literal: true

# Description goes here
#
# exe/rag addons/minimal_css

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

template  'db/seeds.rb'                                   , 'db/seeds.rb'

after_bundle do
  setup_db
end

def setup_db
  add_scaffold('person', 'first_name', 'last_name', 'age:integer', 'address:text')

  db_migrate
  db_seed
end

# Other template command examples
# prepare_environment
# bundle_install
# css_install('tailwind')
# rails_command('db:migrate')
# rails_command('db:migrate')
# bundle_add('hotwire-rails')
# rails_command('hotwire:install')
# run('bin/importmap pin sortablejs')
# run('npm install daisyui')
# rubocop
#
# directory         'app/assets/images'
# create_file       'app/assets/stylesheets/custom-bootstrap-import.scss' , read_template('custom-bootstrap-import.scss')
# append_to_file    'app/assets/config/manifest.js'                       , read_template('manifest.js')
# insert_into_file  'app/views/layouts/application.html.erb', read_template('application.html.erb'),
#     before: %(    <%= javascript_include_tag "application", "data-turbo-track": "reload", defer: true %>)
# gsub_file         'app/views/layouts/application.html.erb', %(container mx-auto mt-28 px-5 flex), 'container mx-auto px-5'
# template 'home.css', 'app/assets/stylesheets/home.css'
#
# add_controller('page', 'benefits', 'faq', 'terms', 'privacy', '--skip-routes')
# route(<<-'RUBY')
# PageController.action_methods.each do |action|
#   get "/#{action}", to: "page##{action}", as: "page_#{action}"
# end
# RUBY
