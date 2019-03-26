require_relative('../db/sql_runner.rb')
require('pry-byebug')

class StockItem

attr_reader :id, :name, :size, :status, :themes, :colour

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @size = options['size'] # code to look up
    @measurements = options['measurements']
    @cleaning_instructions = options['cleaning_instructions']
    @status = options['status']  # code to look up
    @themes = options['themes']  # array of codes to look up
    @colour = options['colour']

    # p @themes
  end

## start database CRUD functions

  def save
    # sql='INSERT INTO stock_items (name, size, measurements, cleaning_instructions, status, themes, colour)
    # VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;'

    # this is the correct syntax, found using Postico:
 sql="INSERT INTO stock_items
 (name, size, measurements, cleaning_instructions, status, themes, colour)
 VALUES ($1,$2,$3,$4,$5,array[8,$7],$6) RETURNING id;"

values = [@name, @size, @measurements, @cleaning_instructions, @status,@colour, 4]

@id = SqlRunner.run(sql, values).first['id'].to_i

# @id = SqlRunner.run(sql).first['id'].to_i
# p 'array#{@themes}'
    # values = [@name, @size, @measurements, @cleaning_instructions, @status, @themes, @colour]
    # @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM stock_items WHERE id = $1;'
    values = [id]
    costume = SqlRunner.run(sql, values).first
    return StockItem.new(costume) if costume != nil
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

  def get_status_msg
    sql='SELECT meaning FROM item_status_codes WHERE id = $1;'
    values=[@status]
    return SqlRunner.run(sql,values).first.map { |status| status[1] }[0]
  end

  def get_themes_array
    return @themes
  end

  def set_themes_array(new_themes_array)
    @themes = new_themes_array
  end

  def get_themes_list_names
    theme_names=[]
    @themes.each do |theme_code|
      sql='SELECT theme FROM theme_codes WHERE id = $1;'
      values=[theme_code]
      theme_names << SqlRunner.run(sql,values).first.map { |status| status[1] }[0]
    end
    return theme_names
  end
# end getters and setters

end # end class
