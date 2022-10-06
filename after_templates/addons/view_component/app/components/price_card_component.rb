class PriceCardComponent < ViewComponent::Base
  attr_reader :card

  def initialize(card)
    @card = card
    super
  end
end