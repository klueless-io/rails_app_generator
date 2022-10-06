class HomeController < ApplicationController
  def index
  end

  def component
    @pricing_data1 = pricing_data_poro
    @pricing_data1.title = nil

    @pricing_data2 = pricing_data_poro
    @pricing_data2.cards.pop() # should change to a three column layout
  end

  private

  def pricing_data_poro
    # OpenStruct is not a good practice: But this makes the HASH and feel like a PORO model
    JSON.parse(pricing_data.to_json, object_class: OpenStruct)
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
