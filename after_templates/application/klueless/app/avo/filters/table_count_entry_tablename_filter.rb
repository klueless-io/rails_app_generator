class TableCountEntryTablenameFilter < Avo::Filters::TextFilter
  self.name = "Table Name"

  def apply(_request, query, value)
    values = value.split(" ")

    values.each do |word|
      query = query.where("table_name ILIKE ?", "%#{word}%")
    end

    query
  end
end
