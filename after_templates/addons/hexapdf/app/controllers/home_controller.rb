class HomeController < ApplicationController
  def index
  end

  def make_pdf
    doc = HexaPDF::Document.new
    canvas = doc.pages.add.canvas
    canvas.font('Helvetica', size: 40)
    name = Faker::Name.name
    canvas.text("Hello #{name}", at: [20, 400])
    doc.write("hello-jin.pdf")

    flash.notice = "PDF Created!"

    render :index
  end
end
