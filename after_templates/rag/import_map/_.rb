# frozen_string_literal: true

# Episode #312 - Importmaps in Rails 7
# https://www.youtube.com/watch?v=veWpot6zfUQ

require 'pry'

def add_customizations
  self.local_template_path = File.dirname(__FILE__)

  gac 'base rails 7 image created'

  add_controller('home', 'index')
  route("root 'home#index'")

  # need a join template metehod
  after_bundle do
    # after bundle hook
    bundle_add('importmap-rails')
    rails_command('importmap:install')

    bundle_add('hotwire-rails')
    rails_command('hotwire:install')

    # run("bin/importmap pin local-time --download")

    # use CDN: ga.jsmp.io
    run('bin/importmap pin sortablejs')
    # => pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.0/modular/sortable.esm.js"
    # use CDN: jsdeliver
    # run("bin/importmap pin sortablejs --from jsdelivr")
    # => pin "sortablejs", to: "https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/modular/sortable.esm.js"

    append_to_file 'app/views/home/index.html.erb', read_template('component-sortable.html')
    template 'position_controller.js', 'app/javascript/controllers/position_controller.js'
    template 'home.css', 'app/assets/stylesheets/home.css'
  end
end

begin
  add_customizations
rescue StandardError => e
  puts e.message
end
