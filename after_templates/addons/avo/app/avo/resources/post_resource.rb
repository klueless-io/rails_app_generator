class PostResource < Avo::BaseResource
  # tutorial (title): https://youtu.be/WgNK-oINFww?t=301
  self.title = :title

  # tutorial (n+1): https://youtu.be/WgNK-oINFww?t=557
  self.includes = [:category]

  # tutorial (search): https://youtu.be/WgNK-oINFww?t=244
  self.search_query = ->(params:) do
    scope
      .ransack(id_eq: params[:q], title_cont: params[:q], m: "or")
      .result(distinct: false)
  end

  # tutorial (edit fields): https://youtu.be/WgNK-oINFww?t=133
  field :id, as: :id
  field :title, as: :text
  field :content, as: :trix
  
  # tutorial (read only fields): https://youtu.be/WgNK-oINFww?t=228
  field :excerpt, as: :text, only_on: :index

  # tutorial (related category): https://youtu.be/WgNK-oINFww?t=328
  field :category, as: :belongs_to
end
