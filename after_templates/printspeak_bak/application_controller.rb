class ApplicationController < ActionController::Base
  def navbar_partial(partial = nil)
    @partial_navbar = partial if partial 
    return @partial_navbar if defined? @partial_navbar
    @partial_navbar = 'layouts/navbar'
  end
  helper_method :navbar_partial

  def head_partial(partial = nil)
    @partial_head = partial if partial 
    return @partial_head if defined? @partial_head
    @partial_head = 'layouts/head'
  end
  helper_method :head_partial

  def footer_partial(partial = nil)
    @partial_footer = partial if partial 
    return @partial_footer if defined? @partial_footer
    @partial_footer = 'layouts/footer'
  end
  helper_method :footer_partial
end
