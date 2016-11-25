require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transaction')

get '/' do
  erb( :index )
end

