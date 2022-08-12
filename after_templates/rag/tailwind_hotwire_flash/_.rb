# frozen_string_literal: true

# Rails 7 hotwire and flash messages


self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index', 'about')
route("root 'home#index'")

after_bundle do
  setup_db
end

def setup_db
  add_scaffold('post', 'title', 'body:text')

  db_migrate
end


