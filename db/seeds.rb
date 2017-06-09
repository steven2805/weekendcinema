require_relative('../customer')
require_relative('../movie')
require_relative('../ticket')
require ('pry-byebug')

customer1 = Customer.new({ 'name' => 'Steven'})
customer1.save()

movie1 = Movie.new({ 'title' => 'Transporter', 'price' => "20"})

movie1.save()



binding.pry 
nil 