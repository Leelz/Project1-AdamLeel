require_relative( '../db/sql_runner' )
require('date')

class Transaction

  attr_reader( :merchant_id, :category_id, :id , :value, :transaction_date)

  def initialize( options )
    @id = nil || options['id'].to_i
    @merchant_id = options['merchant_id']
    @category_id = options['category_id']
    @value = options['value'].to_i
    @transaction_date = Date.parse(options['transaction_date'])
  end

  def save()
    sql = "INSERT INTO transactions (
      merchant_id, category_id, value, transaction_date
    ) VALUES (
      #{ @merchant_id },#{ @category_id }, #{@value}, '#{ @transaction_date}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Transaction.new( hash ) }
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

end