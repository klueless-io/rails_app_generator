# frozen_string_literal: true

# Daisy 
# Do NOT use the --css=tailwind option when using DaisyUI or any other custom plugin syste for tailwindcss

self.local_template_path = File.dirname(__FILE__)

gac 'base rails 7 image created'

add_controller('home', 'index')
route("root 'home#index'")

template 'index.html.erb', 'app/views/home/index.html.erb'      , force: true

after_bundle do
  gem "cssbundling-rails"

  rails_command('css:install:tailwind')
  run('npm install daisyui')

  gsub_file 'tailwind.config.js', %(]\n}), "],\n  plugins: [require(\"daisyui\")],\n}"
end
  