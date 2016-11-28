require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )

#list all the merchant
get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

#make a new merchant with form
get '/merchants/new' do
  @merchants = Merchant.all()
  erb(:"merchants/new")
end

# #submit new merchant so it's saved
post '/merchants' do
  merchant = Merchant.new( params )
  merchant.save
  redirect to('/merchants/new')
end

# CANNOT DELETE DUE TO FOREIGN KEY CONTRAINTS
# post '/merchants/:id/delete'  do
#   Merchant.destroy( params[:id]  )
#   redirect to('/merchants')
# end

# #show a merchant from the db
get '/merchants/:id' do
  @merchant = Merchant.find( params[:id] )
  erb(:"merchants/show")
end

# #edit a merchant
get '/merchants/:id/edit' do
  @merchant = Merchant.find( params[:id] )
  erb(:"merchants/edit")
end

# #update a merchant
post '/merchants/:id' do
  Merchant.update( params)
  redirect to ("/merchants/#{params[:id]}")
end