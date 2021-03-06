require_relative( '../db/sql_runner.rb' )
require_relative( 'customer.rb' )
require_relative( 'tickets.rb' )

class Films

  attr_reader :id, :film_name
  attr_accessor :price, :duration_minutes, :age_rating

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_name = options['film_name']
    @price = options['price'].to_f
    @duration_minutes = options['duration_minutes'].to_i
    @age_rating = options['age_rating'].to_i
  end

  def save()
    sql = "INSERT INTO films (film_name, price, duration_minutes, age_rating)
           VALUES ($1, $2, $3, $4)
           RETURNING * "
    values = [@film_name, @price, @duration_minutes, @age_rating]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    show_list = SqlRunner.run(sql, values)
    films_as_objects = show_list.map{|list| Films.new(list)}
    return films_as_objects
  end

  def update()
    sql = "UPDATE films
           SET (film_name, price, duration_minutes, age_rating) = ($1, $2, $3, $4)
           WHERE id = $5"
    values = [@film_name, @price, @duration_minutes, @age_rating, @id]
    SqlRunner.run(sql, values)
  end

  def Films.find(film_id)
    sql = "SELECT * FROM films
           WHERE id = $1 "
    values = [film_id]
    result = SqlRunner.run(sql, values)
    film_details = result[0]
    film_info = Films.new(film_details)
    return film_info
  end

  def customer_list()
    sql = "SELECT customers.* FROM customers
           INNER JOIN tickets
           ON customers.id = tickets.customer_id
           WHERE film_id = $1 "
    values = [@id]
    result = SqlRunner.run(sql, values)
    people = result.map{|customer| Customer.new(customer)}
    return people
  end

  def customer_count()
    result = customer_list
    return result.count
  end


end
