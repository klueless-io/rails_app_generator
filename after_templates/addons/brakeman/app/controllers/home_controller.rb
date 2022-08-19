class HomeController < ApplicationController
  def index
    xmen_or_avengers = params[:xmen_or_avengers] || 'xmen'
    puts send(xmen_or_avengers.to_sym)
  end

  private

  def xmen
    'Wolverine'
  end

  def avengers
    'Captain America'
  end
end
