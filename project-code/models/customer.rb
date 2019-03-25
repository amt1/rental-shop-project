require_relative('../db/sql_runner.rb')

class Customer

attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @phone = options['phone']
    @email = options['email']
    @address = options['address']
    @account_balance = options['account_balance'].to_i
    @warnings = options['warnings'].to_i
  end

end # end class
