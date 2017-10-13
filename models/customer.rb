require_relative( '../db/sql_runner.rb' )
require_relative( 'films.rb' )
require_relative( 'tickets.rb')

class Customer
  attr_reader :id, :name
  attr_accessor :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
           VALUES ($1, $2)
           RETURNING * "
    values = [@name, @funds]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    roster = SqlRunner.run(sql, values)
    customers_as_objects = roster.map{|person| Customer.new(person)}
    return customers_as_objects
  end

  def update()
    sql = "UPDATE customers
           SET (name, funds) = ($1, $2)
           WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def Customer.find(customer_id)
    sql = "SELECT * FROM customers
           WHERE id = $1"
    values = [customer_id]
    result = SqlRunner.run(sql, values)
    person_details = result[0]
    person_info = Customer.new(person_details)
    return person_info
  end

  def find_films()
    sql = "SELECT films.* FROM films
           INNER JOIN tickets
           ON films.id = tickets.film_id
           WHERE customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    films_seen = result.map{|film| Films.new(film)}
    return films_seen
  end

  # def ticket_cost()


end
