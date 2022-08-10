class HomeController < ApplicationController
  before_action { navbar_partial('navbar') }
  before_action { body_end_partial('body_end') }

  def index
  end
end
