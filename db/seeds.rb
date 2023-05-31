puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = {name: "Dishoom", address: "7 Boundary St, London E2 7JE", rating: 5, chef_name: 'Jamie Oliver'}
pizza_east =  {name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", rating: 4, chef_name: 'Gordon Ramsey'}

[dishoom, pizza_east].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
