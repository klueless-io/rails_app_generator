# tutorial (user resource): https://youtu.be/WgNK-oINFww?t=599
class UserResource < Avo::BaseResource
  # https://docs.avohq.io/2.0/resources.html#devise-password-optional
  # you need to fill in the password when creating a new user,
  # but when editing a user you can leave the password field empty
  self.devise_password_optional = true

  # tutorial (better search experience): https://youtu.be/WgNK-oINFww?t=649
  self.title = :email
  self.includes = []

  self.search_query = ->(params:) do
    scope
      .ransack(id_eq: params[:q], name_cont: params[:q], email_cont: params[:q], m: "or")
      .result(distinct: false)
  end

  field :id, as: :id
  field :email, as: :gravatar, link_to_resource: true, as_avatar: true
  field :name, as: :text
  field :email, as: :text, as_description: true
  field :password, as: :text
  field :posts, as: :has_many
end
