require_relative( '../db/sql_runner' )

class Category

  attr_accessor( :name, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO categories (
      name
    ) VALUES (
      '#{ @name }') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM categories"
    results = SqlRunner.run( sql )
    return results.map { |hash| Category.new( hash ) }
  end

  def self.update( options )
      sql = "UPDATE categories SET
      name ='#{options['name']}'
      WHERE id='#{options['id']}'"
      SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM categories WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Category.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM categories"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM categories where id = #{id}"
    SqlRunner.run( sql )
  end

  def filter_by_category
    sql = "SELECT * FROM categories
    WHERE name=#{name}"
    SqlRunner.run( sql )
    return results.map { |hash| Category.new( hash ) }
  end

end