require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )

#list all the transactions
get '/transactions' do
  # return "transactions"
  @transactions = Transaction.all()
  erb(:index)
end