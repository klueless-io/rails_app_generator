class HomeController < ApplicationController
  def index
  end

  def quick_signin
    sign_in(:user, User.first)
  end

  def reseed
    SeedService.seed(variant: :refresh)

    redirect_back_or_to root_path
  end

  def refresh_material_view
    RubocopEntry.refresh

    redirect_back_or_to root_path
  end
end
