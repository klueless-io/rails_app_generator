# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add Pretender to rails application
    class Pretender < RailsAppGenerator::Addon
      required_gem gem.version('pretender', '0.4.0', 'Log in as another user in Rails')

      def apply
        copy_file('app/controllers/pretender_controller.rb', 'app/controllers/pretender_controller.rb')

        route("post 'pretender/:user_id/impersonate' , to: 'pretender#impersonate'        , :as => :impersonate_user")
        route("post 'pretender/stop_impersonating'   , to: 'pretender#stop_impersonating' , :as => :stop_impersonating_user")
      end
    end
  end
end
