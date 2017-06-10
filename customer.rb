require_relative('db/sql_runner.rb')

class Customer 

  # attr_reader :id 
  attr_accessor :name, :wallet, :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end 

  def save()
    sql = "INSERT INTO customers (name) VALUES ('#{ @name }') RETURNING id"
    user = SqlRunner.run( sql ).first
    @id = user['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end 

  def self.all
    sql = "SELECT * FROM customers"
    return self.get_many(sql)
  end 

  # def update
  #   sql = "UPDATE customers SET (name) = ('#{@name}') WHERE id = #{@id};"
  #   SqlRunner.new(sql) 
  # end 
  def update 
    sql = "UPDATE customers SET (name) = ('#{name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def self.get_many(sql)
    customers_hash = SqlRunner.run(sql)
    result = customers_hash.map {|customer| Customer.new( customer ) }
    return result 
  end 



end


