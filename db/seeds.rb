require( 'pry' )
require_relative( '../models/customer.rb')
require_relative( '../models/films.rb')
require_relative( '../models/tickets.rb')

customer_1 = Customer.new({'name' => 'Claire', 'funds' => 30})

binding.pry
nil
