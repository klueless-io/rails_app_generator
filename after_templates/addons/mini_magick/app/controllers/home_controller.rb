class HomeController < ApplicationController
  def index
    @image_id = params[:image] || 1
    @img = get_image

    @img_rotate = get_image do |options|
      options.resize("300x300")
      options.rotate "-45"
    end

    @img_negate = get_image do |options|
      options.resize("300x300")
      options.negate
    end

    @img_distort = get_image do |options|
      options.resize("300x300")
      options.distort("Perspective", "0,0,0,0 0,45,0,45 69,0,60,10 69,45,60,35")
    end
  end

  private

  def image_name
    image_names = [
      'cat1.jpg',
      'cat2.jpg',
      'cat3.jpg'
    ]
    image_name = image_names[@image_id.to_i - 1]
    puts params
    puts @image_id
    puts image_name

    "app/assets/images/#{image_name}"
  end

  def get_image(&block)
    puts image_name
    image = MiniMagick::Image.open(image_name)
    image.combine_options(&block)

    Base64.encode64(image.to_blob)
  end
end
