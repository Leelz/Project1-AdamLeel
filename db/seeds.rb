require_relative( '../models/category.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )
require('pry-byebug')

Transaction.delete_all
Category.delete_all
Merchant.delete_all

category1 = Category.new({
  'name' => "Food"
})

category1.save

category2 = Category.new({
  'name' => "Clothes"
})

category2.save

category3 = Category.new({
  'name' => "Cosmetics"
})

category3.save

##########################################

merchant1 = Merchant.new({
  'name' => "Primark"
})

merchant1.save

merchant2 = Merchant.new({
  'name' => "Tesco"
})

merchant2.save

merchant3 = Merchant.new({
  'name' => "McDonalds"
})

merchant3.save

merchant4 = Merchant.new({
  'name' => "Waterstones"
})

merchant4.save

transaction1 = Transaction.new({
  'category_id' => category1.id,
  'merchant_id' => merchant1.id,
  'value' => 30,
  'transaction_date' => "20/12/2016"
})

transaction1.save

transaction2 = Transaction.new({
  'category_id' => category1.id,
  'merchant_id' => merchant1.id,
  'value' => 50,
  'transaction_date' => "20/11/2016"
})

transaction2.save