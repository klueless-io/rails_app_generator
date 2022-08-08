class HomeController < ApplicationController
  before_action :css_framework_tailwind, only: :tailwind
  
  def index
  end

  def bootstrap
  end

  def tailwind
  end
end
