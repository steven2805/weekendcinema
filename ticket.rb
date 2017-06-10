require_relative('db/sql_runner.rb')
require_relative('movie')
require_relative('customer')


class Ticket

  attr_reader :id 
  attr_accessor :customer_id, :movie_id

  def initialize( options )
    @id = options['id'].to_i 
    @customer_id = options['customer_id'].to_i
    @movie_id = options['movie_id'].to_i
  end 

  def save(customer,movie)
    # wallet = customer.wallet
    # movie_price = movie.price.to_i
    if customer.wallet < movie.price.to_i 
      return "can't continue"
    else customer.wallet -= movie.price.to_i
    sql = "INSERT INTO tickets (customer_id, movie_id) VALUES ('#{ @customer_id }', '#{@movie_id}') RETURNING id"
    ticket = SqlRunner.run( sql ).first
    @id = ticket['id'].to_i
    customer.update
  end
end 

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end 



end






