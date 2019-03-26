require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/stock_item.rb' )
require('pry')

class TestStockItem < MiniTest::Test

  def setup
    @costume1 = {
      'name' => 'Baby Yoda',
      'size' => '1',
      'measurements' => 'Standard Size',
      'cleaning_instructions' => 'Delicate Wash at 30, No Spin, No Tumble Dry',
      'status' => '1',
      'colour' => 'White'
    }
    @my_test_costume = StockItem.new(@costume1)
    @costume2 = {
      'name' => 'Ensign Redshirt',
      'size' => '1',
      'measurements' => 'Standard Size',
      'cleaning_instructions' => 'Delicate Wash at 30, No Spin, No Tumble Dry',
      'status' => '1',
      'colour' => 'Red'
    }
    @redshirt = StockItem.new(@costume2)
  end

  ## test getters and setters

  def test_item_created
    assert_equal('Baby Yoda', @my_test_costume.name)
    assert_nil(@my_test_costume.id)
  end

  def test_get_costume_measurements
    assert_equal('Standard Size', @my_test_costume.get_measurements)
  end

  def test_get_cleaning_instructions
    assert_equal('Delicate Wash at 30, No Spin, No Tumble Dry', @my_test_costume.get_cleaning_instructions)
  end

  def test_get_status_code
    assert_equal('1',@my_test_costume.get_status_code)
  end

  def test_get_status_msg
    # p @my_test_costume.get_status_msg
    # binding.pry
    assert_equal('In stock, available', @my_test_costume.get_status_msg)
  end
  #
  def test_get_themes_list_names
    # assert_equal(["Star Wars", "Sci Fi"], @my_test_costume.get_themes_list_names)
    # themes moved to a join table now
  end

## end getters and setters

## start testing database CRUD functions

  def test_stock_item_save
    @redshirt.save
    assert_equal(@redshirt.name, StockItem.find_by_id(@redshirt.id).name)
  end

  def test_stock_delete_all
    StockItem.delete_all
    assert_nil(StockItem.find_by_id(1))
    # remember, the order of running the tests is randomized
  end

  def test_delete_1_item
    StockItem.delete_all
    @redshirt.save
    StockItem.find_by_id(@redshirt.id)
    # check it was saved
    assert_equal(@redshirt.name, StockItem.find_by_id(@redshirt.id).name)
    @redshirt.delete
    # test it was deleted
    assert_nil(StockItem.find_by_id(@redshirt.id))
  end

  def test_update_stock_item
    @redshirt.save
    assert_equal('Red', @redshirt.colour)
    @redshirt.set_colour('Black')
    @redshirt.update
    assert_equal('Black', @redshirt.colour)
  # binding.pry
  end
end # end class
