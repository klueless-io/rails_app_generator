class PriceChartComponent < ViewComponent::Base

  CARDS_TWO = 'mt-12 space-y-4 sm:mt-16 sm:grid sm:grid-cols-1 sm:gap-6 sm:space-y-0 lg:mx-auto lg:max-w-4xl lg:max-w-none lg:grid-cols-2'
  CARDS_ODD = 'mt-12 space-y-4 sm:mt-16 sm:grid sm:grid-cols-1 sm:gap-6 sm:space-y-0 lg:mx-auto lg:max-w-4xl lg:max-w-none lg:grid-cols-3 xl:mx-0 xl:max-w-none xl:grid-cols-3'
  CARDS_EVEN = 'mt-12 space-y-4 sm:mt-16 sm:grid sm:grid-cols-1 sm:gap-6 sm:space-y-0 lg:mx-auto lg:max-w-4xl lg:max-w-none lg:grid-cols-2 xl:mx-0 xl:max-w-none xl:grid-cols-4'

  def initialize(chart)
    @chart = chart

    @chart.title = 'Pricing Plans' if @chart.title.nil?
    super
  end

  def card_list_class
    return CARDS_TWO if @chart.cards.length == 2
    return CARDS_ODD if @chart.cards.length.odd?

    CARDS_EVEN
  end
end