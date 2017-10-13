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

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql "DELETE FROM tickets
         WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    results = SqlRunner.run(sql, values)
    tickets_as_objects = results.map{|ticket| Tickets.new(ticket)}
    return tickets_as_objects
  end

  def self.find(ticket_id)
    sql = "SELECT * FROM tickets
           WHERE id = $1"
    values = [ticket_id]
    result = SqlRunner.run(sql, values)
    ticket_details = result[0]
    ticket_info = Tickets.new(ticket_details)
    return ticket_info
  end

end
