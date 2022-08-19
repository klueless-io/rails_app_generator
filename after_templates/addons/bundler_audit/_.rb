# frozen_string_literal: true

# Patch-level verification for Bundler
#
# exe/rag addons/bundler_audit

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

prepare_environment

gem "brakeman", "4.5.0"
gem "curl"

after_bundle do
  setup_customizations
end

def setup_customizations
  route("root 'home#index'")

  force_copy
  
  add_controller('home', 'index', 'advisories')
  
  directory "app/controllers"
  directory "app/assets"
  directory "app/views"
  template  'app/views/layouts/application.html.erb'        , 'app/views/layouts/application.html.erb'
end
