# frozen_string_literal: true

# HTML sanitization for Rails applications
require 'pry'

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

force_copy

copy_file 'home/index.html.erb', 'app/views/home/index.html.erb'
