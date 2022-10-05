class HomeController < ApplicationController
  def index
  end

  def test_data
    SeedService.seed(variant: :test_data)

    redirect_back_or_to root_path
  end

  def seed_data
    SeedService.seed(variant: :seed_data)

    redirect_back_or_to root_path
  end
end
