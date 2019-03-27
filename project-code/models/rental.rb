require_relative('../db/sql_runner.rb')

class Rental

attr_reader :id, :rental_date, :return_due_date, :return_code, :theatre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @stock_item_id = options['stock_item_id'].to_i
    @rental_date = options['rental_date']
    @return_due_date = options['return_due_date']
    @return_code = options['return_code'].to_i if options['return_code']
    @transaction_id = options['transaction_id'].to_i if options['transaction_id']
    @theatre = options['theatre']
  end

# database CRUD functions

def save
  sql = 'INSERT INTO rentals (customer_id, stock_item_id, rental_date, return_due_date, return_code, transaction_id, theatre)
  VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;'
  values = [@customer_id, @stock_item_id, @rental_date, @return_due_date, @return_code, @transaction_id, @theatre]
  @id = SqlRunner.run(sql, values).first['id'].to_i
end

def self.list_all
  sql = 'SELECT * FROM rentals;'
  return SqlRunner.run(sql).map { |rental| Rental.new(rental)  }
end

def self.find_by_id(id)
  sql = 'SELECT * FROM rentals WHERE id = $1;'
  values = [id]
  rental = SqlRunner.run(sql, values).first
  return Rental.new(rental) if rental != nil
end

def self.delete_all
  sql = 'DELETE FROM rentals;'
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM rentals WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end
# end database CRUD functions

# object getters and setters

  def get_customer_id
    return @customer_id
  end
  def set_customer_id(customer_id)
    @customer_id = customer_id
  end

  def get_stock_item_id
    return @stock_item_id
  end
  def set_stock_item_id(stock_item_id)
    @stock_item_id = stock_item_id
  end

  def get_transaction_id
    return @transaction_id
  end
  def set_transaction_id(transaction_id)
    @transaction_id = transaction_id
  end

   def get_theatre
     return @theatre
   end
   def set_theatre(is_it_theatre)
     @theatre=is_it_theatre
   end
   def set_rental_date(start_date)
     @rental_date = start_date
   end
   def set_return_due_date(end_date)
     @return_due_date = end_date
   end

   def set_return_code(return_code)
     @return_code=return_code
   end

   # end object getters and setters

end # end class
