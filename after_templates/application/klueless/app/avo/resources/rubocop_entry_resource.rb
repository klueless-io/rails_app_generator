class RubocopEntryResource < Avo::BaseResource
  filter RubocopEntryFilenameFilter
  filter RubocopEntryMessageFilter
  filter RubocopEntryStatusFilter
  filter RubocopEntryCopFilter

  self.title = :file_name
  self.includes = []

  self.search_query = ->(params:) do
    scope.ransack(
      cop_cont: params[:q],
      file_name_cont: params[:q],
      position_cont: params[:q],
      status_cont: params[:q],
      status_message_cont: params[:q],
      m: "or"
    ).result(distinct: false)
  end

  field :cop            , as: :text
  field :file_name      , as: :text
  # field :full_line      , as: :text
  field :position       , as: :text
  # field :status         , as: :text
  field :status_message , as: :text
  field :message        , as: :text
end
