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
      'colour' => 'White',
      'price' => 10
    }
    @my_test_costume = StockItem.new(@costume1)
    @costume2 = {
      'name' => 'Ensign Redshirt',
      'size' => '4',
      'measurements' => 'Standard Size',
      'cleaning_instructions' => 'Delicate Wash at 30, No Spin, No Tumble Dry',
      'status' => '1',
      'colour' => 'Red',
      'price' => 5
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
    assert_equal(1,@my_test_costume.get_status_code)
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

def test_whopping_list
stock_items_array = StockItem.list_all_with_sizes_and_status
# p stock_items_array[8]
end

def test_themes_list
  list = StockItem.list_all_with_sizes_and_status_pick_theme(5)
p list
end
  # def test_stock_delete_all
  #   StockItem.delete_all
  #   assert_nil(StockItem.find_by_id(1))
  #   # remember, the order of running the tests is randomized
  # end
  #
  # def test_delete_1_item
  #   StockItem.delete_all
  #   @redshirt.save
  #   StockItem.find_by_id(@redshirt.id)
  #   # check it was saved
  #   assert_equal(@redshirt.name, StockItem.find_by_id(@redshirt.id).name)
  #   @redshirt.delete
  #   # test it was deleted
  #   assert_nil(StockItem.find_by_id(@redshirt.id))
  # end

  # def test_update_stock_item
  #   @redshirt.save
  #   assert_equal('Red', StockItem.find_by_id(@redshirt.id).colour)
  #   @redshirt.set_colour('Black')
  #   @redshirt.update
  #   assert_equal('Black', StockItem.find_by_id(@redshirt.id).colour)
  #   @redshirt.set_name('Ensign Blackshirt')
  #   @redshirt.update
  #   assert_equal('Ensign Blackshirt', StockItem.find_by_id(@redshirt.id).name)
  #   @redshirt.set_size_code('3')
  #   @redshirt.update
  #   assert_equal('1', StockItem.find_by_id(@redshirt.id).size)
  #   @redshirt.set_status_code('2')
  #   @redshirt.update
  #   assert_equal(2, StockItem.find_by_id(@redshirt.id).get_status_code)
  #   assert_equal('Booked, unavailable', StockItem.find_by_id(@redshirt.id).get_status_msg)
  #   # p @redshirt.get_status_msg
  #   @redshirt.set_cleaning_instructions('Nuke it from Orbit')
  #   @redshirt.update
  #   assert_equal('Nuke it from Orbit', StockItem.find_by_id(@redshirt.id).get_cleaning_instructions)
  #   @redshirt.set_measurements('Massive, just massive')
  #   @redshirt.update
  #   assert_equal('Massive, just massive', StockItem.find_by_id(@redshirt.id).get_measurements)
  #   @redshirt.set_price(3)
  #   @redshirt.update
  #   assert_equal('3', StockItem.find_by_id(@redshirt.id).price)
  #
  # # binding.pry
  # end

  # def test_get_item_themes
  #   test_item=StockItem.find_by_id(1)
  #   # p test_item.get_themes_list_names
  # # binding.pry
  #   assert_equal(['Sci Fi','Star Wars'], test_item.get_themes_list_names)
  # end

  def test_set_item_themes
    @redshirt.save
    new_themes=[5,6]
    @redshirt.set_themes(new_themes)
    assert_equal(['Sci Fi','Star Trek'], @redshirt.get_themes_list_names)
    # p @redshirt.get_themes_list_names
  end

  def test_get_standard_size
    @my_test_costume.save
    assert_equal('Age 3-4', @my_test_costume.get_standard_size)
  end

  def test_get_sizing
      @my_test_costume.save
      assert_equal('Kids', @my_test_costume.get_size_range)
  end
end # end class
