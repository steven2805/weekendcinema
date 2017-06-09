require_relative('../customer')
require_relative('../movie')
require_relative('../ticket')
require ('pry-byebug')

customer1 = Customer.new({ 'name' => 'Steven','wallet' => 100})

customer1.save()

binding.pry 
nil 