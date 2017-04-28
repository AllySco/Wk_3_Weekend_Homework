require_relative( '../models/customers' )
require_relative( '../models/films' )
require_relative( '../models/tickets' )

require( 'pry-byebug' )

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


customer1 = Customer.new({
  'name' => 'Ally',
  'funds' => '30'
  })
customer2 = Customer.new({
  'name' => 'Daniel',
  'funds' => '40'
  })
customer3 = Customer.new({
  'name' => 'Alex',
  'funds' => '35'
  })

customer1.save()
customer2.save()
customer3.save()


film1 = Film.new ({
  'title' => 'Batman',
  'price' => '8'
  })
film2 = Film.new ({
  'title' => 'Harry Potter',
  'price' => '5'
  })
film3 = Film.new ({
  'title' => 'Pizza Shop 2-Tonys Revenge',
  'price' => '10'
  })

film1.save()
film2.save()
film3.save()



ticket1 = Ticket.new ({
  'customers_id' => customer1.id,
  'films_id' => film1.id
  })
ticket2 = Ticket.new ({
  'customers_id' => customer2.id,
  'films_id' => film1.id
  })
ticket3 = Ticket.new ({
  'customers_id' => customer1.id,
  'films_id' => film3.id
  })
ticket4 = Ticket.new ({
  'customers_id' => customer3.id,
  'films_id' => film2.id
  })
ticket5 = Ticket.new ({
  'customers_id' => customer2.id,
  'films_id' => film3.id
  })
ticket6 = Ticket.new ({
  'customers_id' => customer3.id,
  'films_id' => film3.id
  })


ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()



binding.pry
nil


