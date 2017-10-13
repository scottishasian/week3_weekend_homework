require( 'pry' )
require_relative( '../models/customer.rb')
require_relative( '../models/films.rb')
require_relative( '../models/tickets.rb')

customer_1 = Customer.new({'name' => 'Claire', 'funds' => 30})

customer_2 = Customer.new({'name' => 'Callum', 'funds' => 20})

film_1 = Films.new({
  'film_name' => 'The Martian',
  'price' => 4.50,
  'duration' => 110,
  'age_rating' => 15
  })

binding.pry
nil
