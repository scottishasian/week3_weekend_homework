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

end
