class PriceCardComponent < ViewComponent::Base
  attr_reader :card

  def initialize(card)
    @card = card
    super
  end

  def card_class
    highlight = card.highlight == true ? 'border-7 border-red-500' : 'border-gray-200'
    "divide-y divide-gray-200 rounded-lg border border-7 shadow-sm#{highlight}"
  end
end