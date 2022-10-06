class PriceChartComponent < ViewComponent::Base
  def initialize(chart)
    @chart = chart

    @chart.title = 'Pricing Plans' if @chart.title.nil?
    super
  end

  def card_list_class
    @chart.cards.length.odd? ? 'mt-12 space-y-4 sm:mt-16 sm:grid sm:grid-cols-3 sm:gap-6 sm:space-y-0 lg:mx-auto lg:max-w-4xl xl:mx-0 xl:max-w-none lg:grid-cols-3'
                             : 'mt-12 space-y-4 sm:mt-16 sm:grid sm:grid-cols-2 sm:gap-6 sm:space-y-0 lg:mx-auto lg:max-w-4xl xl:mx-0 xl:max-w-none xl:grid-cols-4'
  end
end