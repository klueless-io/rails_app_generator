class HomeController < ApplicationController
  def index
    @browser = Browser.new(request.user_agent, accept_language: "en-us")
  end
end
