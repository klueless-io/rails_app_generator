class RubocopResource < Avo::BaseResource
  self.title = :display_name
  self.includes = []

  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # field :data, as: :textarea, only_on: [:edit]
  # field :user_name, as: :text
  tool RubocopInfo, show_on: :edit

  # tabs do
  #   tab "List of Cops" do
  #     panel do
  #       field :id, as: :id
  #     end
  #   end
  # end
end
