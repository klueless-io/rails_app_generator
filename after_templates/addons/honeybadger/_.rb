# frozen_string_literal: true

# Make managing application errors a more pleasant experience.
#
# exe/rag addons/honeybadger
# see: https://honeybadger.wistia.com/medias/l3cmyucx8f

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

force_copy

copy_file 'app/views/home/index.html.erb', 'app/views/home/index.html.erb'
copy_file 'app/controllers/application_controller.rb', 'app/controllers/application_controller.rb'
copy_file 'app/controllers/errors_controller.rb', 'app/controllers/errors_controller.rb'

# Test if this is really needed
insert_into_file 'config/application.rb', after: 'class Application < Rails::Application' do
  <<-RUBY
    config.generators.system_tests = nil
  RUBY
end

copy_file 'public/404.html', 'public/404.html'
copy_file 'public/500.html', 'public/500.html'

copy_file 'config/locales/en.yml', 'config/locales/en.yml'

move_file('config/honeybadger.sample.yml', 'config/honeybadger.yml')

after_bundle do
  setup_db
end

def setup_db
  add_scaffold('product', 'name', 'price:integer')
  copy_file 'app/controllers/products_controller.rb', 'app/controllers/products_controller.rb'

  db_migrate
end
