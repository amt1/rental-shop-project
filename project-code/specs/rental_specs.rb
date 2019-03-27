require( 'minitest/autorun' )
require_relative( '../models/rental.rb' )
require( 'minitest/rg' )
require_relative( '../models/stock_item.rb' )
require_relative( '../models/customer.rb' )
require('date')
require('pry')

class TestRental < MiniTest::Test

  def setup
    Rental.delete_all
    Customer.delete_all
    StockItem.delete_all

    @costume1 = {
      'name' => 'Baby Yoda',
      'size' => '1',
      'measurements' => 'Standard Size',
      'cleaning_instructions' => 'Delicate Wash at 30, No Spin, No Tumble Dry',
      'status' => '1',
      'colour' => 'White',
      'price' => 10
    }
    @baby_yoda = StockItem.new(@costume1)
    @costume2 = {
      'name' => 'Ensign Redshirt',
      'size' => '1',
      'measurements' => 'Standard Size',
      'cleaning_instructions' => 'Delicate Wash at 30, No Spin, No Tumble Dry',
      'status' => '1',
      'colour' => 'Red',
      'price' => 5
    }
    @redshirt = StockItem.new(@costume2)
    @baby_yoda.save
    @redshirt.save
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

    @stanley  = Customer.new(@customer1)
    @rolf = Customer.new(@customer2)
    @tommy = Customer.new(@customer3)

    @stanley.save
    @rolf.save
    @tommy.save

    @rental1 = {
      'customer_id' => @stanley.id,
      'stock_item_id' => @redshirt.id,
      'rental_date' => Date.today.strftime('%Y-%m-%d'),
      'return_due_date' => (Date.today+2).strftime('%Y-%m-%d'),
      'return_code' => nil,
      'transaction_id' => nil,
      'theatre' => false
    }
    @stanley_redshirt = Rental.new(@rental1)
  end

  def test_created
    # assert_equal(67, @stanley_redshirt.get_stock_item_id)
  end

  def test_save_rental
    @stanley_redshirt.save
    # p Rental.list_all
    @test_rental =  Rental.find_by_id(@stanley_redshirt.id)
    # binding.pry
    assert_equal(@redshirt.id, @test_rental.get_stock_item_id)
  end


end # end class
