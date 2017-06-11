require_relative('db/sql_runner.rb')



class ShowTime 

  attr_reader :id
  attr_accessor :time, :movie_id, :available


  def initialize( options )
    @id = options['id'].to_i
    @time = options['time']
    @movie_id = options['movie_id'].to_i
    @available = options['available'].to_i
  end


  def save()
      sql = "INSERT INTO show_times (time, movie_id,available) VALUES ('#{ @time }',' #{@movie_id}','#{available}') RETURNING id"
      show = SqlRunner.run( sql ).first
      @id = show['id'].to_i
    end


    def self.delete_all
      sql = "DELETE FROM show_times"
      SqlRunner.run(sql)
    end 







end



