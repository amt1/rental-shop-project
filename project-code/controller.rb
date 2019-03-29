require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require( 'date')
require_relative( './models/rental.rb')
require_relative( './models/customer.rb')
require_relative( './models/stock_item.rb')
require_relative( './models/theme.rb')

also_reload('./models/*')
# home page is at http://localhost:4567/crms

get '/crms' do
  erb(:home)
end

post '/crms/main' do
  erb(:main_menu)
end

get '/crms/main' do
  erb(:main_menu)
end

get '/crms/stock' do
  erb(:stock_menu)
end

get '/crms/customers' do
  erb(:customers_menu)
end

get '/crms/customers/customers_new' do
  erb(:customers_new)
end

get '/crms/customers/list_all_customers' do
  erb(:list_all_customers)
end

post '/crms/customers/customer_details' do
  @my_customer=Customer.find_by_id(params[:customer_id])
  erb(:customer_details)
end

post '/crms/customers/update_customer' do
  @update_id = params[:id]
  @update_customer=Customer.find_by_id(@update_id)
  @update_customer.set_name(params[:name])
  @update_customer.set_phone(params[:phone])
  @update_customer.set_email(params[:email])
  @update_customer.set_address(params[:address])
  @update_customer.set_account_balance(params[:account_balance])
  @update_customer.set_warnings(params[:warnings])
  @update_customer.update
  redirect '/crms/customers/list_all_customers'
end

post '/crms/customers/delete_customer' do
  @delete_id = params[:id]
  @my_customer=Customer.find_by_id(@delete_id)
  @my_customer.delete
  redirect '/crms/customers/list_all_customers'
end

post '/crms/customers/customer_rentals' do
  @customer_id = params[:customer_id]
  erb(:customer_rentals)
end

post '/crms/customers/process_new' do
  @my_customer={
    'name' => params[:name],
    'phone' => params[:phone],
    'email' => params[:email],
    'address' => params[:address],
    'account_balance' => params[:account_balance],
    'warnings' => params[:warnings]
  }
  Customer.new(@my_customer).save
  redirect '/crms/customers/list_all_customers'
end

post '/crms/rentals/return' do
  @item_name = params[:stock_item_name]
  @due_date = params[:return_due_date]
  @stock_item_id = params[:stock_item_id]
  @rental_id=params[:rental_id]
  @current_rental = Rental.find_by_id(@rental_id)
  erb(:return)
end

post '/crms/rentals/process_return' do
  @stock_item_id = params[:stock_item_id]
  @return_code=params[:return_code]
  @item_status=params[:item_status]
  @rental_id=params[:rental_id]
  @my_stock_item = StockItem.find_by_id(@stock_item_id)
  @current_rental = Rental.find_by_id(@rental_id)
#  binding.pry
  @current_rental.return_rental(@return_code, @my_stock_item, @item_status)
  @msg="You returned "+" #{@my_stock_item.name}"
  redirect '/crms/rentals/current_rentals_list'
end

post '/crms/rentals/choose_rental_customer' do
  @stock_item_id = params[:stock_item_id]
  @price = params[:price].to_i
  @customer_id=params[:customer_id]
  @customer_name=params[:customer_name]
  @customer_phone=params[:customer_phone]
  @customer_email=params[:customer_email]
  @theatre=params[:theatre]
  @my_options={
    'id' => @customer_id,
    'name' => @customer_name,
    'phone' => @customer_phone,
    'email' => @customer_email,
  }
  # binding.pry
  @found_customers=Customer.find_for_rental(@my_options)
  # test value
  @customer_id=1

  # binding.pry
erb(:confirm_rental)
#  erb(:choose_rental_customer)
end

post '/crms/rentals/confirm' do

end

post '/crms/rentals/create_rental' do
  @theatre=params[:theatre]
  @stock_item_id = params[:stock_item_id]
  @customer_id=params[:customer_id]
  @rental_date = params[:rental_date]
  @return_due_date = params[:return_due_date]
  @return_code = 1
  @my_new_rental = {
    'stock_item_id' => @stock_item_id,
    'customer_id' => @customer_id,
    'rental_date' => @rental_date,
    'return_due_date' => @return_due_date,
    'return_code' => @return_code,
    'theatre' => @theatre
  }
  @created_rental = Rental.new(@my_new_rental)
  @created_rental.save
  redirect '/crms/rentals/current_rentals_list'

end
get '/crms/rentals' do
  erb(:rentals_menu)
end

get '/crms/rentals/current_rentals_list' do
  erb(:current_rentals_list)
end

post '/crms/stock_items/costume_rental_history' do
  @stock_item_id = params[:id]
  # binding.pry
  erb(:costume_rental_history)
end
post '/crms/stock_items/list_by_theme' do
  @theme_code = params[:theme_code]
  # binding.pry
  erb(:list_by_theme)
end
get '/crms/stock_items/stock_new' do
  erb(:stock_new)
end

post '/crms/stock_items/process_new_stock' do
  @my_new_stock={
    'name' => params[:name],
    'size' => params[:size],
    'measurements' => params[:measurements],
    'cleaning_instructions' => params[:cleaning_instructions],
    'status' => params[:status],
    'colour' => params[:colour],
    'price' => params[:price],
    'theme_code' => params[:theme_code]
  }
  StockItem.new(@my_new_stock).save
  redirect '/crms/stock_items/list_all_stock'
end

get '/crms/stock_items/list_all_stock' do
  erb(:list_all_stock)
end

get '/crms/stock_items/costume_search' do
  erb(:costume_search)
end

post '/crms/stock_items/delete_stock_item' do
  @delete_id = params[:id]
  @my_stock_item=StockItem.find_by_id(@delete_id)
  @my_stock_item.delete
  redirect '/crms/stock_items/list_all_stock'
end

post '/crms/stock_items/stock_item_details' do
  @my_stock_item=StockItem.find_by_id(params[:id])
  erb(:stock_item_details)
end

post '/crms/stock_items/update_stock_item' do
  @update_id = params[:id]
  @update_stock_item=StockItem.find_by_id(@update_id)
  @update_stock_item.set_name(params[:name])
  @update_stock_item.set_size_code(params[:size])
  @update_stock_item.set_measurements(params[:measurements])
  @update_stock_item.set_cleaning_instructions(params[:cleaning_instructions])
  @update_stock_item.set_status_code(params[:status])
  @update_stock_item.set_colour(params[:colour])
  @update_stock_item.set_price(params[:price])
  @update_stock_item.set_themes([params[:theme_code]])
  @update_stock_item.update
  redirect '/crms/stock_items/list_all_stock'
end

post '/crms/stock_items/rent' do
  @stock_item_id = params[:id]
  @price = params[:price]
erb(:find_rental_customer)
end
