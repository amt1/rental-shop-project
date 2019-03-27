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

end # end class
