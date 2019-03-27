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

get '/crms/rentals' do
  erb(:rentals_menu)
end

get '/crms/rentals/current_rentals_list' do
  erb(:current_rentals_list)
end
