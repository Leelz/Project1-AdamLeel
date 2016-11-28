require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category.rb' )

#list all the category
get '/transactions/categories' do
  @categories = Category.all()
  erb(:"categories/index")
end

#make a new category with form
get '/transactions/categories/new' do
  @categories = Category.all()
  erb(:"categories/new")
end

#submit new category so it's saved
post '/transactions/categories' do
  category = Category.new( params )
  category.save
  redirect to('/transactions/categories/new')
end

# CANNOT DELETE DUE TO FOREIGN KEY CONTRAINTS
#   post '/transactions/categories/:id/delete'  do
#   Category.destroy( params[:id]  )
#   redirect to('/transactions/categories')
# end

# #show a category from the db
get '/transactions/categories/:id' do
  @category = Category.find( params[:id] )
  erb(:"categories/show")
end

# #edit a category
get '/transactions/categories/:id/edit' do
  @category = Category.find( params[:id] )
  erb(:"categories/edit")
end

# #update a category
post '/transactions/categories/:id' do
  Category.update( params)
  redirect to ("/transactions/categories/#{params[:id]}")
end