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

end
