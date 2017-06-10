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

  # handing out the error of wrong arguements given but the same code works with the movies the only diferece is the @ with the name field. 

  # def update
  #   sql = "UPDATE customers SET (name) = ('#{@name}') WHERE id = #{@id};"
  #   SqlRunner.new(sql) 
  # end 

  def update 
    sql = "UPDATE customers SET (name) = ('#{name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


    def movies()
      sql = "SELECT movies.* FROM movies
INNER JOIN tickets ON tickets.movie_id = movies.id WHERE customer_id = #{@id};"
      movies_hash = SqlRunner.run(sql)
      result = movies_hash.map { |movie| Movie.new(movie)}
      return result 
    end 


  def self.get_many(sql)
    customers_hash = SqlRunner.run(sql)
    result = customers_hash.map {|customer| Customer.new( customer ) }
    return result 
  end 



end


