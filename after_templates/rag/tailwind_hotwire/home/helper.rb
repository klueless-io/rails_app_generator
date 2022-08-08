# frozen_string_literal: true

module HomeHelper
  def rand_color
    format('#%06x', (rand * 0xffffff))
  end
end
