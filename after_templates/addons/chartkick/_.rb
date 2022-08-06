# frozen_string_literal: true

# require 'pry'

# Create beautiful JavaScript charts with one line of Ruby
#
# exe/rag addons/chartkick

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

template  'db/seeds.rb'                                   , 'db/seeds.rb'

copy_file 'config/initializers/chartkick.rb' , 'config/initializers/chartkick.rb'

after_bundle do
  setup_db
  db_seed
end

def setup_db
  add_scaffold('yogurt', 'flavour')
  add_scaffold('people', 'name')
  copy_file 'app/views/people/_person.html.erb'             , 'app/views/people/_person.html.erb'
  
  db_migrate
end
