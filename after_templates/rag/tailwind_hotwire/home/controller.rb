# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def increment
    @counter = (params[:counter]&.to_i || 0) + 1
  end
end
