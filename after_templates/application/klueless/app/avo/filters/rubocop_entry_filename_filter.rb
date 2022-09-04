class RubocopEntryFilenameFilter < Avo::Filters::TextFilter
  self.name = "FileName"

  def apply(_request, query, value)
    values = value.split(" ")

    values.each do |word|
      query = query.where("file_name ILIKE ?", "%#{word}%")
    end

    query
  end
end
