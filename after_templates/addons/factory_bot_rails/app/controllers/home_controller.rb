class HomeController < ApplicationController
  def index
  end

  def reseed
    SeedService.seed
  end
end
