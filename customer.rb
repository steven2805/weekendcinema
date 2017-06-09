require_relative('db/sql_runner.rb')

class Customer 

  attr_reader :id 
  attr_accessor :name, :wallet 

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @wallet = options['wallet']
  end 

  def save()
    sql = "INSERT INTO customers (name) VALUES ('#{ @name }','#{@wallet}') RETURNING id"
    user = SqlRunner.run( sql ).first
    @id = user['id'].to_i
  end

end


