require_relative('../db/sql_runner.rb')
require('pry-byebug')

class StockItem

attr_reader :id, :name, :size, :status, :colour, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @size = options['size'] # code to look up
    @measurements = options['measurements']
    @cleaning_instructions = options['cleaning_instructions']
    @status = options['status'].to_i  # code to look up
    # @themes = options['themes']  # array of codes to look up
    # themes moved to a join table now
    @colour = options['colour']
    @price = options['price']
    # p @themes
    @theme_code = options['theme_code']
  end

## start database CRUD functions

  def save
    sql='INSERT INTO stock_items (name, size, measurements, cleaning_instructions, status, colour, price)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;'
    values = [@name, @size, @measurements, @cleaning_instructions, @status, @colour, @price]
    @id = SqlRunner.run(sql, values).first['id'].to_i
    if @theme_code != nil
      sql2='INSERT INTO item_themes (theme_code, item_id) VALUES ($1, $2);'
      values=[@theme_code, @id]
      SqlRunner.run(sql2, values)
    end
# originally tried to store multiple themes using an array, which seemed like it almost worked.
# abandoned this approach for a join table now. Keeping code commented out below for now
    # this is the correct syntax, found using Postico:
#  sql="INSERT INTO stock_items
#  (name, size, measurements, cleaning_instructions, status, themes, colour)
#  VALUES ($1,$2,$3,$4,$5,array[4,$7],$6) RETURNING id;"
# test=7
# test2=8
# values = [@name, @size, @measurements, @cleaning_instructions, @status,@colour]
#
# @id = SqlRunner.run(sql, values).first['id'].to_i

# @id = SqlRunner.run(sql).first['id'].to_i
# p 'array#{@themes}'
    #
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM stock_items WHERE id = $1;'
    values = [id]
    costume = SqlRunner.run(sql, values).first
    return StockItem.new(costume) if costume != nil
  end

  def self.find_by_name(name)
    # here it would be good to match keywords using regular expressions
  sql = 'SELECT *  FROM stock_items WHERE name = $1;'
    values = [name]
    stock_list = SqlRunner.run(sql, values).map { |costume| StockItem.new(costume) }
    return stock_list
  end

  def self.delete_all
    sql = 'DELETE FROM stock_items;'
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM stock_items WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update
    sql = 'UPDATE stock_items SET (name, size, measurements, cleaning_instructions, status, colour, price)
    = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8;'
    values = [@name, @size, @measurements, @cleaning_instructions, @status, @colour, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.list_all
    sql='SELECT * FROM stock_items;'
    return SqlRunner.run(sql).map { |stock_item| StockItem.new(stock_item)  }
  end

  def self.list_all_available
    sql='SELECT * FROM stock_items WHERE status = 1;'
    return SqlRunner.run(sql).map { |stock_item| StockItem.new(stock_item)  }
  end

  def self.list_all_with_sizes
    sql='SELECT stock_items.*, sizing, standard_size FROM sizes
    JOIN stock_items ON sizes.id = stock_items.size ORDER BY stock_items.name, size;'
    sql_stock_items_hash=SqlRunner.run(sql)
    return sql_stock_items_hash.map(&:values)
  end

  def self.list_all_with_sizes_and_status
    sql='SELECT stock_items.*, sizing, standard_size, meaning FROM sizes
    JOIN stock_items ON sizes.id = stock_items.size
    JOIN item_status_codes ON stock_items.status = item_status_codes.id
    ORDER BY stock_items.name, size;'
    sql_stock_items_hash=SqlRunner.run(sql)
    return sql_stock_items_hash.map(&:values)
  end

  def self.list_all_with_sizes_status_and_themes
    sql='SELECT stock_items.*, sizing, standard_size, meaning, theme_code, theme_type, theme  FROM sizes
    JOIN stock_items ON sizes.id = stock_items.size
    JOIN item_status_codes ON stock_items.status = item_status_codes.id
    LEFT JOIN item_themes ON stock_items.id = item_id
    LEFT JOIN theme_codes ON item_themes.theme_code = theme_codes.id
    ORDER BY stock_items.name, size;'
    sql_stock_items_hash=SqlRunner.run(sql)
    return sql_stock_items_hash.map(&:values)
  end

  def self.list_all_with_sizes_and_status_pick_theme(theme_code)
    sql='SELECT stock_items.*, sizing, standard_size, meaning, theme_type, theme FROM sizes
    JOIN stock_items ON sizes.id = stock_items.size
    JOIN item_status_codes ON stock_items.status = item_status_codes.id
    RIGHT JOIN item_themes ON stock_items.id = item_id
    LEFT JOIN theme_codes ON item_themes.theme_code = theme_codes.id
    WHERE theme_code = $1
    ORDER BY stock_items.name, size;'
    values = [theme_code]
    sql_stock_items_hash=SqlRunner.run(sql, values)
    return sql_stock_items_hash.map(&:values)
  end

  def self.list_all_with_one_size(size_code)
    sql='SELECT stock_items.*, sizing, standard_size FROM sizes
    JOIN stock_items ON sizes.id = stock_items.size WHERE stock_items.size = $1 ORDER BY stock_items.name;'
    values = [size_code]
    sql_stock_items_hash=SqlRunner.run(sql, values)
    return sql_stock_items_hash.map(&:values)
  end

  def self.list_all_available_with_one_size(size_code)
    sql='SELECT stock_items.*, sizing, standard_size FROM sizes
    JOIN stock_items ON sizes.id = stock_items.size WHERE stock_items.size = $1 AND status=1 ORDER BY stock_items.name;'
    values = [size_code]
    sql_stock_items_hash=SqlRunner.run(sql, values)
    return sql_stock_items_hash.map(&:values)
  end

  def get_themes_list_names
    theme_names=[]
    # @themes.each do |theme_code|
    #   sql='SELECT theme FROM theme_codes WHERE id = $1;'
    #   values=[theme_code]
    sql= 'SELECT theme FROM theme_codes
    JOIN item_themes ON theme_codes.id = item_themes.theme_code
    WHERE item_themes.item_id = $1
    ORDER BY theme;'
    values=[@id]
    # query works in Postico, returns Sci Fi and Star Wars
      theme_names = SqlRunner.run(sql,values).map { |theme_name| theme_name['theme'] }
    # it's still getting data out of arrays and hashes in the right format I'm having trouble with -
    #need to practise this
    return theme_names
  end

  def set_themes(theme_codes) # should take an array, these will come from checkboxes
    theme_codes.each do |theme_code|
      sql='INSERT INTO item_themes ( theme_code, item_id) VALUES ($1, $2);'
      values=[theme_code, @id]
      SqlRunner.run(sql,values)
    end
  end

  def get_status_msg
    sql='SELECT meaning FROM item_status_codes WHERE id = $1;'
    values=[@status]
    return SqlRunner.run(sql,values).first.map { |status| status[1] }[0]
  end

  def get_standard_size
    sql='SELECT standard_size FROM sizes WHERE id = $1;'
    values=[@size]
    return SqlRunner.run(sql,values).first.map { |size| size[1] }[0]
  end

  def get_size_range
    sql='SELECT sizing FROM sizes WHERE id = $1;'
    values=[@size]
    return SqlRunner.run(sql,values).first.map { |size| size[1] }[0]
  end
## end database CRUD functions

## start getters and setters
  def set_name(new_name)
    @name = new_name
  end

  def set_size_code(new_size_code)
    @size = new_size_code
  end

  def set_colour(new_colour)
    @colour = new_colour
  end

  def get_measurements
    return @measurements
  end

  def set_measurements(new_measurements)
    @measurements=new_measurements
  end

  def get_cleaning_instructions
    return @cleaning_instructions
  end

  def set_cleaning_instructions(new_cleaning_instructions)
    @cleaning_instructions = new_cleaning_instructions
  end

  def get_status_code
    return @status
  end

  def set_status_code(new_status_code)
    @status = new_status_code
  end

  def set_price(new_price)
    @price=new_price
  end

  def get_themes_array
    return @themes
  end

# def set_theme_code(new_theme_code)
#   @theme_code = new_theme_code
# end
# end getters and setters


end # end class
