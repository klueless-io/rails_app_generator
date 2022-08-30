class RubocopLogQuery < SqlQuery
  sql_resource './rubocop_log.psql'
  fields %i(position status status_message cop message full_line file_name)

  def call
    sql_query = "#{sql} LIMIT 5"

    query(sql_query)
  end
end
