class RubocopEntryCopFilter < Avo::Filters::MultipleSelectFilter
  self.name = "Cop"

  def apply(_request, query, values)
    query.where(cop: values)
  end

  def options
    RubocopEntry
      .select(:cop)
      .distinct
      .order(:cop)
      .map { |entry| [entry.cop, entry.cop] }.to_h
  end
end
