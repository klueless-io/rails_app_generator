class RailsAppResource < Avo::BaseResource
  self.title = :display_name
  self.includes = []

  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :name, as: :text

  field :db_schema, as: :has_one
  field :table_count, as: :has_one
  field :rubocop, as: :has_one
end
