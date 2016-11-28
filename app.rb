require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchant_controller')
require_relative('controllers/category_controller')
require_relative('controllers/transaction_controller')

get '/' do
  @transactions = Transaction.all()
  erb( :index )
end

