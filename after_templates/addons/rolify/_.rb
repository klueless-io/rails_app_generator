# frozen_string_literal: true

# Role management library with resource scoping
#
# exe/rag addons/rolify

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

after_bundle do
  scaffolds
  setup_customizations
  setup_db
end

def scaffolds
  add_scaffold('post', 'title', 'body:text')
end

def setup_customizations
  route("root 'home#index'")
  route("get 'home/quick_sign_in/:user_id', to: 'home#quick_sign_in', as: 'quick_sign_in'")
  route("get 'rolify/:id', to: 'rolify#show', as: 'rolify'")
  route("get 'rolify/:id/edit', to: 'rolify#edit', as: 'edit_rolify'")
  route("patch 'rolify/:id', to: 'rolify#update'")

  force_copy
  
  add_controller('home', 'index', 'quick_sign_in', 'bossy_boots', 'use_in_moderation', 'use_me', 'super_hero')

  directory "app/controllers"
  directory "app/models"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
end

def setup_db
  template  'db/seeds.rb'                                   , 'db/seeds.rb'

  db_migrate
  db_seed
end
