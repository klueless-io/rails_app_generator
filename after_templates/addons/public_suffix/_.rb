# frozen_string_literal: true

# PublicSuffix can parse and decompose a domain name into top level domain, domain and subdomains.
#
# exe/rag addons/public_suffix

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

