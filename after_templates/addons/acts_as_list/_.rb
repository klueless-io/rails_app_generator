# frozen_string_literal: true

# This "acts_as" extension provides the capabilities for sorting and reordering a number of objects in a list. The class that has this specified needs to have a "position" column defined as an integer on the mapped database table.
#
# exe/rag addons/acts_as_list

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

force_copy

add_scaffold('todo_list', 'name')
add_scaffold('todo_item', 'task', 'position:integer', 'todo_list:references')

copy_file 'app/controllers/home_controller.rb'            , 'app/controllers/home_controller.rb'
copy_file 'app/controllers/todo_items_controller.rb'      , 'app/controllers/todo_items_controller.rb'
copy_file 'app/models/todo_list.rb'                       , 'app/models/todo_list.rb'
copy_file 'app/models/todo_item.rb'                       , 'app/models/todo_item.rb'

copy_file 'app/views/home/index.html.erb'                 , 'app/views/home/index.html.erb'

copy_file 'app/views/layouts/_alerts.html.erb'            , 'app/views/layouts/_alerts.html.erb'
copy_file 'app/views/layouts/_navbar.html.erb'            , 'app/views/layouts/_navbar.html.erb'
copy_file 'app/views/layouts/_footer.html.erb'            , 'app/views/layouts/_footer.html.erb'
template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'

copy_file 'app/views/todo_items/index.html.erb'           , 'app/views/todo_items/index.html.erb'
copy_file 'app/views/todo_items/_todo_item.html.erb'      , 'app/views/todo_items/_todo_item.html.erb'

copy_file 'config/routes.rb'                              , 'config/routes.rb'

template  'db/seeds.rb'                                   , 'db/seeds.rb'

after_bundle do
  setup_db
end

def setup_db
    
  db_migrate
  rails_command('db:seed')
end
