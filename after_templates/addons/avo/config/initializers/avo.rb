# frozen_string_literal: true

# For more information regaring these settings check out our docs https://docs.avohq.io
Avo.configure do |config|
  ## == Routing ==
  config.root_path = '/admin'

  # https://docs.avohq.io/2.0/customization.html
  config.app_name = 'Custom Application'
  config.id_links_to_resource = true
  # config.resource_controls_placement = :left

  # Where should the user be redirected when visting the `/avo` url
  # config.home_path = nil

  ## == Licensing ==
  config.license = 'pro' # change this to 'pro' when you add the license key
  config.license_key = ENV['AVO_LICENSE_KEY']

  ## == Set the context ==
  config.set_context do
    # Return a context object that gets evaluated in Avo::ApplicationController
  end

  ## == Authentication ==
  config.current_user_method = :current_user
  # config.authenticate_with = {}

  ## == Authorization ==
  # config.authorization_methods = {
  #   index: 'index?',
  #   show: 'show?',
  #   edit: 'edit?',
  #   new: 'new?',
  #   update: 'update?',
  #   create: 'create?',
  #   destroy: 'destroy?',
  # }
  # config.raise_error_on_missing_policy = false

  ## == Localization ==
  # config.locale = 'en-US'

  ## == Customization ==
  # config.app_name = 'Avocadelicious'
  # config.timezone = 'UTC'
  # config.currency = 'USD'
  # config.per_page = 24
  # config.per_page_steps = [12, 24, 48, 72]
  # config.via_per_page = 8
  # config.default_view_type = :table
  # config.hide_layout_when_printing = false
  # config.id_links_to_resource = false
  # config.full_width_container = false
  # config.full_width_index_view = false
  # config.cache_resources_on_index_view = true
  # config.search_debounce = 300
  # config.view_component_path = "app/components"
  # config.display_license_request_timeout_error = true
  # config.disabled_features = []

  ## == Breadcrumbs ==
  # config.display_breadcrumbs = true
  config.set_initial_breadcrumbs do
    add_breadcrumb "Home", '/admin'
  end

  ## == Menus ==
  config.main_menu = -> {
    section "Dashboards", icon: "dashboards" do
      all_dashboards
    end

    section "Resources", icon: "resources" do
      group "Blog" do
        resource :post
        # resource :comment
        resource :category
        resource :author
      end

      group "Reservations" do # , collapsable: true, collapsed: true
        resource :location
        resource :room
        resource :booking
      end

      group "Admin" do
        resource :user
      end
    end

    section "Tools", icon: "tools" do
      all_tools
    end

    section I18n.t('admin.external_links'), icon: "heroicons/outline/link", collapsable: true, collapsed: true do
      link 'Appy Dave', path: 'https://appydave.com', target: :_blank
      link 'Klueless', path: 'https://klueless.io/', target: :_blank
    end
  }
  config.profile_menu = -> {
    link "Profile", path: "/admin/profile", icon: "user-circle"
  }
end
