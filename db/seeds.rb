require( 'pry' )
require_relative( '../models/customer.rb')
require_relative( '../models/films.rb')
require_relative( '../models/tickets.rb')

customer_1 = Customer.new({'name' => 'Claire', 'funds' => 30})

customer_2 = Customer.new({'name' => 'Callum', 'funds' => 20})

film_1 = Films.new({
  'film_name' => 'The Martian',
  'price' => 4.50,
  'duration_minutes' => 110,
  'age_rating' => 15
  })

film_2 = Films.new({
  'film_name' => 'Big Trouble in Little China',
  'price' => 7.61,
  'duration_minutes' => 90,
  'age_rating' => 12
  })

binding.pry
nil
