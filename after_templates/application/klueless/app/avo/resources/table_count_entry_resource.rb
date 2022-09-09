class TableCountEntryResource < Avo::BaseResource
  filter TableCountEntryTablenameFilter

  self.title = :table_count
  self.includes = []

  self.search_query = ->(params:) do
    scope.ransack(
      table_count_cont: params[:q],
      m: "or"
    ).result(distinct: false)
  end

  field :table_count, as: :text
  field :au, as: :text
  field :eu, as: :text
  field :us, as: :text
end
