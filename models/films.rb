require_relative( '../db/sql_runner.rb' )
require_relative( 'customer.rb' )
require_relative( 'tickets.rb' )

class Films

  attr_reader :id, :film_name
  attr_accessor :price, :duration_minutes, :age_rating

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_name = options['film_name']
    @price = options['price'].to_i
    @duration_minutes = options['duration'].to_i
    @age_rating = options['age_rating'].to_i
  end

end
