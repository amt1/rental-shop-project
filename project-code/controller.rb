require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/rental.rb')
require_relative( './models/customer.rb')
require_relative( './models/stock_item.rb')
also_reload('./models/*')
# home page is at http://localhost:4567/crms

get '/crms' do
  erb(:home)
end

get '/crms/main' do
  erb(:main_menu)
end
