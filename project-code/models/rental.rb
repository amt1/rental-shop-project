require_relative('../db/sql_runner.rb')

class Rental

attr_reader :id, :rental_date, :rental_due_date, :return_code, :theatre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @stock_id = options['stock_id']
    @rental_date = options['rental_date']
    @rental_due_date = options['rental_due_date']
    @return_code = options['return_code']
    @transaction_id = options['transaction_id']
    @theatre = options['theatre']
  end

# object getters and setters

  def get_customer_id
    return @customer_id
  end
  def set_customer_id(customer_id)
    @customer_id = customer_id
  end

  def get_stock_id
    return @stock_id
  end
  def set_stock_id(stock_id)
    @stock_id = stock_id
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
   def set_rental_due_date(end_date)
     @rental_due_date = end_date
   end

   def set_return_code(return_code)
     @return_code=return_code
   end

   # end object getters and setters

end # end class
