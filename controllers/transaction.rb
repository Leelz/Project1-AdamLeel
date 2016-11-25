require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/category.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )

#list all the students
get '/transactions' do
  @transaction = Transaction.all
  erb(:index)
end