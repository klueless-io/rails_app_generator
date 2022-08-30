class SqlQuery
  attr_reader :opts
  attr_reader :sql
  attr_reader :record

  def initialize(**opts)
    @opts   = opts
    @sql    = self.class.sql
    @record = self.class.record
  end

  def query(sql_query)
    result = connection.execute(sql_query)
    result.map { |row| record.new(**row) }
  end

  class << self
    attr_reader :sql
    attr_reader :record

    def query(**opts)
      new(**opts).call
    end

    def sql_resource(filename)
      sql_file = File.expand_path(filename, File.dirname(__FILE__))
      @sql = File.read(sql_file)
    end

    def fields(fields)
      @record = Struct.new(*fields, keyword_init: true)
    end
  end

  protected

  def connection
    ActiveRecord::Base.connection
  end
end
