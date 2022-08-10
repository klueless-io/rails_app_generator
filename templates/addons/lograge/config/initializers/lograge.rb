# frozen_string_literal: true

Rails.application.configure do
  config.lograge.enabled = true

  # config.lograge.keep_original_rails_log = true

  # config.lograge.custom_options = lambda do |event|
  #   { time1: Time.now, time2: event.time }
  # end

  # config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"
end