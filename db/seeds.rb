require_relative('../customer')
require_relative('../movie')
require_relative('../ticket')
require ('pry-byebug')

Customer.delete_all
Movie.delete_all
Ticket.delete_all

customer1 = Customer.new({ 'name' => 'Steven', 'wallet' => "10"})
customer2 = Customer.new({ 'name' => 'Kirsty', 'wallet' => "200"})

customer1.save()
customer2.save()

movie1 = Movie.new({ 'title' => 'Transporter', 'price' => "20"})
movie2 = Movie.new({'title' => 'ghostbusters', 'price' => '15'})

movie1.save()
movie2.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'movie_id' => movie1.id})
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'movie_id' => movie2.id})
ticket3 = Ticket.new({ 'customer_id' => customer1.id, 'movie_id' => movie2.id})

ticket1.save(customer1,movie1)
ticket2.save(customer2,movie2)
ticket3.save(customer1,movie2)





binding.pry 
nil 