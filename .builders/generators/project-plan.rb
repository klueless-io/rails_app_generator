KManager.action :project_plan do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(rounded: 1, glass: 1)
      .page('In progress', theme: :style_03, margin_left: 0, margin_top: 0) do
        grid_layout(y: 90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'add profile - rag_tailwind_hotwire_flash')
      end
      .page('To Do', theme: :style_02, margin_left: 0, margin_top: 0) do

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'add google fonts')
        # <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        # <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />

        todo(title: 'broken profile - tailwind-hotwire-form - tailwind-hotwire-form-search, tailwind-hotwire-flash, ')

        todo(title: 'look at the sample tailwind pages in P7 and turn them into an addon')

        todo(title: 'add auto open flag to profile and command line')
        todo(title: 'add profile - stimulas')
        todo(title: 'add profile - hotwire')
        todo(title: 'add profile - turbo')
        todo(title: 'add profile - vue')
        todo(title: 'add profile - svelte')
        todo(title: 'add profile - react')
        todo(title: 'add profile - vite')         # see: /Users/davidcruwys/dev/printspeak/printspeak-r7-test1
        todo(title: 'add profile - docker')       # https://www.youtube.com/watch?v=ZhrnqHVVo1g
        todo(title: 'add encryption')             # https://youtu.be/ZmwNzod1trk?t=701
        todo(title: 'cli help support for diff')
        todo(title: 'cli support for rails new (rag new should work like rails new) - buggy, need to work through')
        todo(title: 'need an option for deleting target project path') # FileUtils.rm_rf(instance.target_path)
      end
      .page('Done', theme: :style_06, margin_left: 0, margin_top: 0) do

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'add addon - acts_as_list')
        todo(title: 'add addon - administrate')
        todo(title: 'add addon - annotate')
        todo(title: 'add addon - bcrypt')
        todo(title: 'add addon - browser')
        todo(title: 'add addon - chartkick')
        # continuous_integration
        # devise
        todo(title: 'add addon - dotenv')
        # factory_bot
        todo(title: 'add addon - faker')
        # generators
        todo(title: 'add addon - groupdate')
        todo(title: 'add addon - hexapdf')
        todo(title: 'add addon - httparty')
        # high_voltage
        todo(title: 'add addon - honeybadger')
        todo(title: 'add addon - lograge')
        todo(title: 'add addon - mini_magick')
        todo(title: 'add addon - motor_magick')
        todo(title: 'add addon - public_suffix')
        todo(title: 'add addon - phony_rails')
        # pundit
        todo(title: 'add addon - rails_html_sanitizer')
        todo(title: 'add addon - redcarpet')
        todo(title: 'add addon - groupdate')
        todo(title: 'add addon - rubocop')
        todo(title: 'add addon - twilio_ruby')

        todo(title: 'add profile - tailwind-emulating-bootstrap')
        todo(title: 'add profile - tailwind-hotwire-form-search')
        todo(title: 'add profile - tailwind-hotwire-form')
        todo(title: 'add profile - tailwind-hotwire')
        todo(title: 'add profile - import-map') # vs esbuild - import_map is a replacement for webpacker
        todo(title: 'profile - fix the bootstrap profile')
        todo(title: 'cli support for profile')
        todo(title: 'separate CLI methods into include modules')
        todo(title: 'cli support for diff')
        todo(title: 'add diff tool - open in editor')
        todo(title: 'add diff tool supporting lhs only, rhs only, same and different')
        todo(title: 'add project plan to do list')
      end
      .cd(:docs)
      .save('project-plan/project.drawio')
      .export_svg('project-plan/project_in_progress', page: 1)
      .export_svg('project-plan/project_todo'       , page: 2)
      .export_svg('project-plan/project_done'       , page: 3)
  end
end
