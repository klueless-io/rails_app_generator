class HomeController < ApplicationController
  def index
  end

  def questions
    @questions = StackExchange.new("stackoverflow", 1).questions
    @questions = clean_data(@questions)
  end

  def users
    @users = StackExchange.new("stackoverflow", 1).users
    @users = clean_data(@users)
  end

  def clean_data(data)
    encode_utf8 = data.to_json.encode('UTF-8', invalid: :replace, undef: :replace)
    JSON.parse(encode_utf8)
  end
end

class StackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service, page)
    @options = { query: { site: service, page: page } }
  end

  def questions
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end

