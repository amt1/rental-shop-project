require_relative('../db/sql_runner.rb')

class Theme

attr_accessor :id, :theme_type, :theme

def initialize(options)
    @id = options['id'].to_i if options['id']
    @theme_type = options['theme_type']
    @theme = options['theme']
end

def save
  sql='INSERT INTO theme_codes (theme_type, theme) VALUES ($1, $2) RETURNING id;'
  values=[@theme_type, @theme]
  @id = SqlRunner.run(sql, values).first['id'].to_i
end

def self.list_for_dropdown
  sql = 'SELECT * from theme_codes ORDER BY $1, $2;'
  values=[@theme_type, @theme]
  array_of_hashes=SqlRunner.run(sql, values)
  themes_array = array_of_hashes.map { |theme| Theme.new(theme)}
  return themes_array
end

def self.find_by_id(id)
  sql = 'SELECT * FROM theme_codes WHERE id = $1;'
  values = [id]
  theme = SqlRunner.run(sql, values).first
  return Theme.new(theme) if theme != nil
end

def self.find_by_name(name)
  # here it would be good to match keywords using regular expressions
sql = 'SELECT *  FROM theme_codes WHERE theme = $1;'
  values = [name]
  theme_list = SqlRunner.run(sql, values).map { |theme| Theme.new(theme) }
  return theme_list
end

def self.delete_all
  sql = 'DELETE FROM theme_codes;'
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM theme_codes WHERE id = $1;"
  values = [@id]
  SqlRunner.run( sql, values )
end

end # end class
