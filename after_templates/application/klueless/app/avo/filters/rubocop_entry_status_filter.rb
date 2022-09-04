class RubocopEntryStatusFilter < Avo::Filters::SelectFilter
  self.name = "Status"

  def apply(_request, query, value)
    query.where(status: value)
  end

  def options
    RubocopEntry
      .select(:status)
      .distinct
      .order(:status)
      .map { |entry| [entry.status, entry.status] }.to_h
  end
end
