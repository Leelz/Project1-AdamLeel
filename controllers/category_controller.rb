require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category.rb' )

#list all the category
get '/categories' do
  @categories = Category.all()
  erb(:"categories/index")
end

#make a new category with form
get '/categories/new' do
  @categories = Category.all()
  erb(:"categories/new")
end

# #submit new category so it's saved
post '/categories' do
  category = Category.new( params )
  category.save
  redirect to('/categories/new')
end

# CANNOT DELETE DUE TO FOREIGN KEY CONTRAINTS
#   post '/categories/:id/delete'  do
#   Category.destroy( params[:id]  )
#   redirect to('/categories')
# end

# #show a category from the db
get '/categories/:id' do
  @category = Category.find( params[:id] )
  erb(:"categories/show")
end

# #edit a category
get '/categories/:id/edit' do
  @category = Category.find( params[:id] )
  erb(:"categories/edit")
end

# #update a Category
post '/categories/:id' do
  Category.update( params)
  redirect to ("/categories/#{params[:id]}")
end