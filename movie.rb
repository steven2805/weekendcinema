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
    sql = "INSERT INTO movies (title) VALUES ('#{ @title }') RETURNING id"
    movie = SqlRunner.run( sql ).first
    @id = movie['id'].to_i
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