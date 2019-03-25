require( 'minitest/autorun' )
require_relative( '../models/customer.rb' )
require('pry')

class TestCustomer < MiniTest::Test

  def setup
    @customer1 = {
      'name' => 'Stanley Treshansky',
      'phone' => '555-1234',
      'email' => 'stanley@fakeemail.com',
      'address' => '1 The Road, Happytown',
      'account_balance' => 10,
      'warnings' => 0
    }
    @customer2 = {
      'name' => 'Rolf Treshansky',
      'phone' => '555-5678',
      'email' => 'rolf@fakeemail.com',
      'address' => '2 The Road, Happytown',
      'account_balance' => 100,
      'warnings' => 1
    }
    @customer3 = {
      'name' => 'Tommy Treshansky',
      'phone' => '555-3456',
      'email' => 'tommy@fakeemail.com',
      'address' => '3 The Road, Happytown',
      'account_balance' => 0,
      'warnings' => 2
    }
    @customer4 = {
      'name' => 'Ensign Redshirt',
      'phone' => '555-5555',
      'email' => 'redshirt@fakeemail.com',
      'address' => '4 The Road, Happytown',
      'account_balance' => 1000,
      'warnings' => 0
    }
    @my_test_customer = Customer.new(@customer1)
    @stanley  = Customer.new(@customer1)
    @rolf = Customer.new(@customer2)
    @tommy = Customer.new(@customer3)
    @redshirt = Customer.new(@customer4)

  end

  def test_customer_created
    assert_equal('Stanley Treshansky', @my_test_customer.name)
    assert_nil(@my_test_customer.id)
  end

  def test_customer1_saved
    @my_test_customer.save
    # p 'saved...'
    # p @my_test_customer
    # # p 'found by id...'
    # p Customer.find_by_id(@my_test_customer.id)
    # binding.pry
    assert_equal(@my_test_customer.name, Customer.find_by_id(@my_test_customer.id).name)

    # assert_equal(@my_test_customer, Customer.find_by_id(@my_test_customer.id))
    # interesting, testing for identity fails because the find_by_id method recreates @my_test_customer as a new Customer object

  end

  def test_customers_delete_all
    Customer.delete_all
    assert_nil(Customer.find_by_id(1))
    # remember, the order of running the tests is randomized
  end

  def test_all_customers_saved
    Customer.delete_all
    @stanley.save
    @rolf.save
    @tommy.save
    customer_list = Customer.list_all.map { |customer| customer.name }
    # p customer_list
    assert_equal([@stanley.name, @rolf.name, @tommy.name], customer_list)
  end

  def test_delete_1_customer
    Customer.delete_all
    @redshirt.save
    Customer.find_by_id(@redshirt.id)
    # check it was saved
    assert_equal(@redshirt.name, Customer.find_by_id(@redshirt.id).name)
    @redshirt.delete
    # test it was deleted
    assert_nil(Customer.find_by_id(@redshirt.id))
  end

end # end class
