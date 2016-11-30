require_relative( '../db/sql_runner' )
require('date')

class Transaction

  attr_accessor( :merchant_id, :category_id, :id , :value, :transaction_date, :item)

  def initialize( options )
    @id = nil || options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @value = options['value'].to_f
    @item = options['item']
    @transaction_date = Date.parse(options['transaction_date'])
  end

  def save()
    sql = "INSERT INTO transactions ( 
    merchant_id,category_id,value,transaction_date,item
    ) VALUES (
    #{@merchant_id}, #{@category_id}, #{@value}, '#{@transaction_date}', '#{@item}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Transaction.new( hash ) }
  end

  def self.filter_by_category( category_id )
    sql = "SELECT * FROM transactions WHERE category_id=#{category_id}"
    results = SqlRunner.run( sql )
    return results.map { |hash| Transaction.new( hash ) }
  end

  def self.update( options )
    sql = "UPDATE transactions SET
    merchant_id='#{options['merchant_id']}',
    category_id='#{options['category_id']}',
    value='#{options['value']}',
    transaction_date='#{options['transaction_date']}',item='#{options['item']}'
    WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM transactions WHERE id='#{id}'"
    results = SqlRunner.run( sql )
    return Transaction.new( results.first )
  end

  def merchant
    sql = "SELECT * FROM merchants m
    INNER JOIN transactions t
    ON t.merchant_id = m.id
    WHERE m.id = #{@merchant_id}"
    results = SqlRunner.run( sql )
    return Merchant.new( results.first )
  end

  def category
    sql = "SELECT * FROM categories c
    INNER JOIN transactions t
    ON t.category_id = c.id
    WHERE c.id = #{@category_id}"
    results = SqlRunner.run( sql )
    return Category.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.total(transactions)
    total_value = 0
    for transaction in transactions
      total_value += transaction.value
    end
    return total_value
  end

end