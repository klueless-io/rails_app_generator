# frozen_string_literal: true

# Rails HTML Sanitizer is responsible for sanitizing HTML fragments in Rails applications, i.e. in the sanitize, sanitize_css, strip_tags and strip_links methods.
require 'pry'

self.local_template_path = local_template_base(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

force_copy

copy_file 'index.html.erb', 'app/views/home/index.html.erb'
