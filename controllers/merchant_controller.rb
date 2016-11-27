require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )

#list all the transactions
get '/merchants' do
  @transactions = Transaction.all()
  erb(:index)
end

#make a new transaction with form
get '/transactions/new' do
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

#show a transaction from the db
get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] )
  erb(:show)
end

#edit a transaction
get '/transactions/:id/edit' do
  @transaction = Transaction.find( params[:id] )
  erb(:edit)
end

#update a transaction
post '/transactions/:id' do
  Transaction.update( params)
  redirect to ("/transactions/#{params[:id]}")
end