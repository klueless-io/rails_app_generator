class ApplicationController < ActionController::Base
  before_action do |_|
    Honeybadger.context(
      user_email: 'klueless-io@example.com',
      name: 'David',
      company: 'AppyDave'
    )
  end
end
