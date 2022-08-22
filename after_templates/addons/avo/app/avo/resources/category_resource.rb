class CategoryResource < Avo::BaseResource
  # tutorial (related category): https://youtu.be/WgNK-oINFww?t=328

  self.title = :title
  self.includes = []

  self.search_query = ->(params:) do
    scope
      .ransack(id_eq: params[:q], name_cont: params[:q], title_cont: params[:q], description_cont: params[:q], m: "or")
      .result(distinct: false)
  end

  field :id, as: :id
  field :title, as: :text
  field :excerpt, as: :text, only_on: :index
  field :description, as: :textarea

  # tutorial (computed field): https://youtu.be/WgNK-oINFww?t=514
  field :posts_count, as: :text do |model|
    model.posts.count
  end

  # tutorial (attach scope): https://youtu.be/WgNK-oINFww?t=423
  field :posts, as: :has_many, attach_scope: -> { 
    query.where.not(category_id: parent.id).or(query.where(category_id: nil))
  }
end
