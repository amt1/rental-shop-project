require( 'minitest/autorun' )
require_relative( '../models/customer.rb' )


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
    @my_test_customer = Customer.new(@customer1)

  end

  def test_customer_created
    assert_equal('Stanley Treshansky', @my_test_customer.name)
    assert_nil(@my_test_customer.id)
  end

end # end class
