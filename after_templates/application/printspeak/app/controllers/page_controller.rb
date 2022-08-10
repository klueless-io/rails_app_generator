# frozen_string_literal: true

class PageController < ApplicationController
  before_action { navbar_partial('navbar') }

  def benefits; end

  def faq; end

  def terms; end

  def privacy; end
end
