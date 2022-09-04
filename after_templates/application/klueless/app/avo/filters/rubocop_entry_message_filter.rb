class RubocopEntryMessageFilter < Avo::Filters::TextFilter
  self.name = "Message"

  def apply(_request, query, value)
    values = value.split(" ")

    values.each do |word|
      query = query.where("message ILIKE ?", "%#{word}%")
    end

    query
  end
end
