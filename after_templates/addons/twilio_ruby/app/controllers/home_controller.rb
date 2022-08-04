class HomeController < ApplicationController
  after_action -> { flash.discard }, if: -> { request.xhr? }

  def index
  end

  def send_sms
    client = Twilio::REST::Client.new

    message = client.messages.create( 
      to: ENV['TWILIO_MY_PHONE'],
      body: "#{Time.now.strftime("%I:%M %p")} - #{random_message}",
      messaging_service_sid: ENV['TWILIO_MESSAGING_SERVICE_SID']
    ) 

    flash.notice = "Message sent to #{message.to} with ID #{message.sid}<br />#{message.body}".html_safe

    render 'home/index'
  rescue Twilio::REST::RestError => error
    error_message = "#{error.code} - #{error.message}"
    error_message = "Invalid 'To' Phone Number"   if error.code == 21211
    error_message = "Not found"                   if error.code == 20404
    flash.alert   = error_message
    puts '22222222222'
    render 'home/index'
  end

  private

  def random_message
    [
      "The changing of down comforters to cotton bedspreads always meant the squirrels had returned.",
      "The father died during childbirth.",
      "It's much more difficult to play tennis with a bowling ball than it is to bowl with a tennis ball.",
      "Jason lived his life by the motto, 'Anything worth doing is worth doing poorly.'",
      "It was difficult for Mary to admit that most of her workout consisted of exercising poor judgment.",
      "Their argument could be heard across the parking lot.",
      "The mysterious diary records the voice.",
      "My secretary is the only person who truly understands my stamp-collecting obsession.",
      "They did nothing as the raccoon attacked the lady’s bag of food.",
      "It was the first time he had ever seen someone cook dinner on an elephant.",
      "I had a friend in high school named Rick Shaw, but he was fairly useless as a mode of transport.",
      "She was amazed by the large chunks of ice washing up on the beach.",
      "On each full moon",
      "Check back tomorrow; I will see if the book has arrived.",
      "A good example of a useful vegetable is medicinal rhubarb.",
      "Beach-combing replaced wine tasting as his new obsession.",
      "While on the first date he accidentally hit his head on the beam.",
      "The balloons floated away along with all my hopes and dreams.",
      "For the 216th time, he said he would quit drinking soda after this last Coke.",
      "The swirled lollipop had issues with the pop rock candy."
    ].sample
  end
end
