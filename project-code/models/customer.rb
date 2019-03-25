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
    sql = 'SELECT * FROM customers WHERE name = $1;'
    values = [name]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer) if customer != nil
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

end # end class
