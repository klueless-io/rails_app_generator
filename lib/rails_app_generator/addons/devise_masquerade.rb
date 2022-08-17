# frozen_string_literal: true

module RailsAppGenerator
  # Custom add-ons for RailsAppGenerator
  module AddOns
    # Add DeviseMasquerade to rails application
    class DeviseMasquerade < RailsAppGenerator::Addon
      depends_on :devise

      required_gem gem.version('devise_masquerade', '1.3.12', 'Devise extension that enables login as another user functionality')

      def apply
        # NOTE: update_routes_with_devise_controllers is being handled in devise.rb addon
      end

      # def update_routes_with_devise_controllers
      #   in_root do
      #     gsub_file 'config/routes.rb', /registrations: "users\/registrations"/, 'registrations: "users/registrations", masquerades: "users/masquerades"'
      #   end
      # end
    end
  end
end
