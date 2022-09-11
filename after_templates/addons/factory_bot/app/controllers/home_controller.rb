class HomeController < ApplicationController
  def index
  end

  def reseed
    SeedService.seed(variant: :reset)

    redirect_back_or_to root_path
  end
end
