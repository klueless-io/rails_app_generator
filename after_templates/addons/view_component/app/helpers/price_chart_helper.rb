module PriceChartHelper
  def price_chart(chart_data)
    render PriceChartComponent.new(chart_data)
  end
end