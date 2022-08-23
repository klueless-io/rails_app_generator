class HomeController < ApplicationController
  def index
  end

  def quick_signin
    sign_in(:user, User.first)
  end

  def reseed
    SeedService.seed
  end
end
