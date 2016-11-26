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

#make a new transaction with form
get '/transactions/new' do
  @categories = Category.all
  @merchants = Merchant.all
  erb(:new)
end

#submit new transaction so it's saved
post '/transactions' do
  transaction = Transaction.new( params )
  transaction.save
  redirect to('/transactions')
end

#delete a transaction from the db
post 'transactions/:id/delete'  do
  Transaction.destroy( params[:id]  )
  redirect to('/transactions')
end

#show a student from the db
get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] )
  erb(:show)
end