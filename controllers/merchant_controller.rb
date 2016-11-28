require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )

#list all the merchant
get '/transactions/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

#make a new merchant with form
get '/transactions/merchants/new' do
  @merchants = Merchant.all()
  erb(:"merchants/new")
end

# #submit new merchant so it's saved
post '/transactions/merchants' do
  merchant = Merchant.new( params )
  merchant.save
  redirect to('/transactions/merchants/new')
end

# CANNOT DELETE DUE TO FOREIGN KEY CONTRAINTS
# post '/transactions/merchants/:id/delete'  do
#   Merchant.destroy( params[:id]  )
#   redirect to('/transactions/merchants')
# end

# #show a merchant from the db
get '/transactions/merchants/:id' do
  @merchant = Merchant.find( params[:id] )
  erb(:"merchants/show")
end

# #edit a merchant
get '/transactions/merchants/:id/edit' do
  @merchant = Merchant.find( params[:id] )
  erb(:"merchants/edit")
end

# #update a merchant
post '/transactions/merchants/:id' do
  Merchant.update( params)
  redirect to ("/transactions/merchants/#{params[:id]}")
end