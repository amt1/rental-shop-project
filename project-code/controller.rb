require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require( 'date')
require_relative( './models/rental.rb')
require_relative( './models/customer.rb')
require_relative( './models/stock_item.rb')
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

get '/crms/rentals' do
  erb(:rentals_menu)
end

get '/crms/rentals/current_rentals_list' do
  erb(:current_rentals_list)
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
