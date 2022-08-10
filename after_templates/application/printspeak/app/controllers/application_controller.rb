class ApplicationController < ActionController::Base
  def navbar_partial(partial = nil)
    @partial_navbar = partial if partial 
    return @partial_navbar if defined? @partial_navbar
    @partial_navbar = 'layouts/navbar'
  end
  helper_method :navbar_partial

  def footer_partial(partial = nil)
    @partial_footer = partial if partial 
    return @partial_footer if defined? @partial_footer
    @partial_footer = 'layouts/footer'
  end
  helper_method :footer_partial

  # Useful for scripts that go just before </head>
  def head_partial(partial = nil)
    @partial_head = partial if partial 
    return @partial_head if defined? @partial_head
    @partial_head = 'layouts/head'
  end
  helper_method :head_partial

  # Useful for scripts that go just before </body>
  def body_end_partial(partial = nil)
    @partial_body_end = partial if partial 
    return @partial_body_end if defined? @partial_body_end
    @partial_body_end = 'layouts/body_end'
  end
  helper_method :body_end_partial
end
