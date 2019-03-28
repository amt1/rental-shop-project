require_relative('../db/sql_runner.rb')
# require('pry')

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

  def get_contact_info
    return [@phone, @email, @address]
  end
  def get_phone
    return @phone
  end

  def get_email
    return @email
  end

  def get_address
    return @address
  end

  def get_account_balance
    return @account_balance
  end

  def get_warnings
    return @warnings
  end

  def get_warnings_msg
    case @warnings
    when 0
      return "All OK"
    when 2
      return "Customer is Banned."
    else
      return "Warning: Customer has previously returned items late or damaged."
    end
  end

  def set_phone(new_phone)
      @phone = new_phone
  end

  def set_email(new_email)
      @email = new_email
  end

  def set_address(new_address)
      @address = new_address
  end

  def add_to_account_balance(amount)
    @account_balance += amount
  end

  def set_warnings(level)
    @warnings = level
  end

  def save
    sql = 'INSERT INTO customers (name, phone, email, address, account_balance, warnings)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;'
    values = [@name, @phone, @email, @address, @account_balance, @warnings]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.list_all
    sql = 'SELECT * FROM customers;'
    return SqlRunner.run(sql).map { |customer| Customer.new(customer)  }
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM customers WHERE id = $1;'
    values = [id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer) if customer != nil
  end

  def self.find_by_name(name)
    # sql = 'SELECT name, id  FROM customers WHERE soundex(name) = soundex($1) ORDER BY name;'
# need to find how to install soundex or similar function
sql = 'SELECT *  FROM customers WHERE name = $1;'
    values = [name]
    customer_list = SqlRunner.run(sql, values).map { |customer| Customer.new(customer) }
    return customer_list
  end

  def self.delete_all
    sql = 'DELETE FROM customers;'
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update
    # sql = "UPDATE customers SET $1 = $2 WHERE id = $3;"
  # tested in Postico and this works: UPDATE customers SET phone = '555-1234' WHERE id = 278;
    # values=[column, contents, @id]
    # binding.pry
    sql = 'UPDATE customers SET (name, phone, email, address, account_balance, warnings)
    = ($1, $2, $3, $4, $5, $6) WHERE id = $7;'
    values = [@name, @phone, @email, @address, @account_balance, @warnings, @id]
    SqlRunner.run(sql, values)
  end

end # end class
