class HomeController < ApplicationController
  def index
  end

  def component
    @pricing_data1 = pricing_data_poro
    @pricing_data1.title = nil # let the component set a default title

    @pricing_data2 = pricing_data_poro(3)
    @pricing_data2.cards[1].highlight = true # highlight the second card

    @pricing_data3 = pricing_data_poro(2)
    @pricing_data3.title = 'Only 2 Plans'
  end

  private

  def pricing_data_poro(take_cards = nil)
    data = pricing_data
    data[:cards] = data[:cards].take(take_cards) if take_cards
    # OpenStruct is not a good practice: But this makes the HASH and feel like a PORO model
    JSON.parse(data.to_json, object_class: OpenStruct)
  end

  def pricing_data
    {
      title: 'Pricing Plans via Components',
      cards: [
        {
          price: '$12',
          heading: 'Hobby',
          description: 'All the basics for having fun and make a few bucks',
          items: ['Potenti felis, in cras at at ligula nunc.', 'Orci neque eget pellentesque.']
        },
        {
          price: '$24',
          heading: 'Freelancer',
          description: 'All the basics for starting a new business',
          items: ['Potenti felis, in cras at at ligula nunc.', 'Orci neque eget pellentesque.', 'Donec mauris sit in eu tincidunt etiam.']
        },
        {
          price: '$32',
          heading: 'Startup',
          description: 'What you need to starting building an empire',
          items: ['Potenti felis, in cras at at ligula nunc.', 'Orci neque eget pellentesque.', 'Donec mauris sit in eu tincidunt etiam.', 'Faucibus volutpat magna.'] },
        {
          price: '$48',
          heading: 'Enterprise',
          description: 'Scalability and reliablity for your business',
          items: ['Potenti felis, in cras at at ligula nunc.', 'Orci neque eget pellentesque.', 'Donec mauris sit in eu tincidunt etiam.', 'Faucibus volutpat magna.', 'Id sed tellus in varius quisque.', 'Risus egestas faucibus.', 'Risus cursus ullamcorper.']
        }
      ]  
    }
  end
end
