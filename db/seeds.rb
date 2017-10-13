require( 'pry' )
require_relative( '../models/customer.rb')
require_relative( '../models/films.rb')
require_relative( '../models/tickets.rb')

Tickets.delete_all
Films.delete_all
Customer.delete_all

customer_1 = Customer.new({'name' => 'Claire', 'funds' => 30})
customer_1.save

customer_2 = Customer.new({'name' => 'Callum', 'funds' => 20})
customer_2.save

customer_3 = Customer.new({'name' => 'Shonna', 'funds' => 45})
customer_3.save

customer_4 = Customer.new({'name' => 'Juliette', 'funds' => 100})
customer_4.save

film_1 = Films.new({
  'film_name' => 'The Martian',
  'price' => 4.50,
  'duration_minutes' => 110,
  'age_rating' => 15
  })

film_2 = Films.new({
  'film_name' => 'Big Trouble in Little China',
  'price' => 7.61,
  'duration_minutes' => 104,
  'age_rating' => 12
  })

film_3 = Films.new({
  'film_name' => 'Tommy Wiseau\'s The Room',
  'price' => 1.01,
  'duration_minutes' => 99,
  'age_rating' => 12
  })

film_1.save
film_2.save
film_3.save

ticket_1 = Tickets.new({
  'customer_id' => customer_1.id,
  'film_id' => film_2.id
  })

ticket_2 = Tickets.new({
  'customer_id' => customer_2.id,
  'film_id' => film_1.id
  })

ticket_3 = Tickets.new({
  'customer_id' => customer_3.id,
  'film_id' => film_1.id
  })

ticket_4 = Tickets.new({
  'customer_id' => customer_4.id,
  'film_id' => film_2.id
  })
ticket_5 = Tickets.new({
  'customer_id' => customer_2.id,
  'film_id' => film_3.id
  })

ticket_1.save
ticket_2.save
ticket_3.save
ticket_4.save
ticket_5.save

binding.pry
nil
