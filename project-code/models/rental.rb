require_relative('../db/sql_runner.rb')
require_relative( './customer.rb' )
require_relative( './stock_item.rb' )

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

def update
  sql = 'UPDATE rentals
  SET (customer_id, stock_item_id, rental_date, return_due_date, return_code, transaction_id, theatre)
  = ($1, $2, $3, $4, $5, $6, $7);'
  values = [@customer_id, @stock_item_id, @rental_date, @return_due_date, @return_code, @transaction_id, @theatre]
  SqlRunner.run(sql, values)
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

# rent and return items
  def rent(stock_item_id, customer_id, rental_date, return_due_date, theatre)
# see what the form sends, whether these arguments should be
# listed or an options hash 
    @stock_item_id=stock_item_id
    @customer_id=customer_id
    @theatre=theatre
    @rental_date=rental_date if (rental_date !=nil) else @rental_date=Date.today.strftime('%Y-%m-%d')
    if (return_due_date !=nil)
      @return_due_date=return_due_date
    elsif theatre
      @return_due_date=(rental_date+7).strftime('%Y-%m-%d')
    else
      @return_due_date=(rental_date+2).strftime('%Y-%m-%d')
    end
    @return_code=1
    update
    # @transaction_id=Transaction.new(@id).id
    # update
    # add transactions as an extension later
    # can we avoid updating twice?

  end
# end rent and return items

# database info functions

def get_return_status_msg
  sql='SELECT meaning FROM rental_return_codes WHERE id = $1;'
  values=[@return_code]
  return SqlRunner.run(sql,values).first.map { |status| status[1] }[0]
end

def self.list_current_rentals
  sql='SELECT * FROM rentals WHERE return_code = 1 ORDER BY return_due_date;'
  return SqlRunner.run(sql).map { |rental| Rental.new(rental)  }
end
# end database info functions

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
