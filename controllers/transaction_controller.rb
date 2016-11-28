require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )

#list all the transactions
get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

#make a new transaction with form
get '/transactions/new' do
  @categories = Category.all
  @merchants = Merchant.all
  erb(:"transactions/new")
end

#submit new transaction so it's saved
post '/transactions' do
  transaction = Transaction.new( params )
  transaction.save
  redirect to('/transactions')
end

#delete a transaction from the db
post '/transactions/:id/delete'  do
  Transaction.destroy( params[:id]  )
  redirect to('/transactions')
end

#show a transaction from the db
get '/transactions/:id' do
  @categories = Category.all
  @merchants = Merchant.all
  @transaction = Transaction.find( params[:id] )
  erb(:"transactions/show")
end

#show a transaction from the db by category_id
get '/transactions/:merchant' do
  @categories = Category.all
  @merchants = Merchant.all
  @transaction = Transaction.find( params[:id] )
  erb(:"transactions/show")
end

#edit a transaction
get '/transactions/:id/edit' do
  @categories = Category.all
  @merchants = Merchant.all
  @transaction = Transaction.find( params[:id] )
  erb(:"transactions/edit")
end

#update a transaction
post '/transactions/:id' do
  Transaction.update( params)
  redirect to ("/transactions/#{params[:id]}")
end