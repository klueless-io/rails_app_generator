class HomeController < ApplicationController
  def index
  end

  def visitors_by_monument
    @visitors = VisitorsByMonument.all.order(:visits)
  end

  def individual_visitors_by_monument
    @visitors = IndividualVisitorsByMonument.all.order(:visits)
  end

  def reseed
    SeedService.seed(variant: :refresh)

    redirect_back_or_to root_path
  end

  def refresh_material_view
    IndividualVisitorsByMonument.refresh

    redirect_back_or_to root_path
  end
end
