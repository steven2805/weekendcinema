require_relative('db/sql_runner.rb')

class Movie 

  attr_reader :id
  attr_accessor :title, :price 

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']

  end


  def save()
    sql = "INSERT INTO movies (title, price) VALUES ('#{ @title }','#{@price}') RETURNING id"
    movie = SqlRunner.run( sql ).first
    @id = movie['id'].to_i
  end

  def update 
    sql = "UPDATE movies SET (title) = ('#{@title}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
INNER JOIN tickets ON tickets.customer_id = customers.id WHERE movie_id = #{@id};"
    customer_hash = SqlRunner.run(sql)
    result = customer_hash.map { |customer| Customer.new(customer)}
    return result 
  end 


  def self.all 
    sql = "SELECT * FROM movies"
    return self.get_many(sql)
  end 


  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end 


  def self.get_many(sql)
    movies_hash = SqlRunner.run(sql)
    result = movies_hash.map {|movie| Movie.new( movie ) }
    return result 
  end 










end 