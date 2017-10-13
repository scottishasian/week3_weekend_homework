require_relative( '../db/sql_runner.rb' )
require_relative( 'customer.rb' )
require_relative( 'films.rb' )

class Tickets

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
           VALUES ($1, $2)
           RETURNING * "
    values = [@customer_id, @film_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

end
