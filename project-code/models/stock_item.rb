require_relative('../db/sql_runner.rb')

class StockItem

attr_reader :id, :name, :size, :status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @size = options['size']
    @measurements = options['measurements']
    @cleaning_instructions = options['cleaning_instructions']
    @status = options['status']
  end

end # end class
