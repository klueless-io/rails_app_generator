KManager.action :project_plan do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(rounded: 1, glass: 1)
      .page('In progress', theme: :style_03, margin_left: 0, margin_top: 0) do
        grid_layout(y: 90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

      end
      .page('To Do', theme: :style_02, margin_left: 0, margin_top: 0) do

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'add auto open flag to profile and command line')
        todo(title: 'add profile - stimulas')
        todo(title: 'add profile - hotwire')
        todo(title: 'add profile - vue')
        todo(title: 'add profile - svelte')
        todo(title: 'cli help support for diff')
        todo(title: 'cli support for rails new (rag new should work like rails new) - buggy, need to work through')
        todo(title: 'need an option for deleting target project path') # FileUtils.rm_rf(instance.target_path)
      end
      .page('Done', theme: :style_06, margin_left: 0, margin_top: 0) do

        grid_layout(y:90, direction: :horizontal, grid_h: 80, grid_w: 320, wrap_at: 3, grid: 0)

        todo(title: 'add profile - import maps')
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