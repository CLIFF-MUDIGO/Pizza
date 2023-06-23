
# Clear existing data
RestaurantPizza.destroy_all
Restaurant.destroy_all
Pizza.destroy_all

# Create Restaurants
restaurant1 = Restaurant.create(name: "Sottocasa NYC", address: "298 Atlantic Ave, Brooklyn, NY 11201")
restaurant2 = Restaurant.create(name: "PizzArte", address: "69 W 55th St, New York, NY 10019")

# Create Pizzas
pizza1 = Pizza.create(name: "Cheese", ingredients: "Dough, Tomato Sauce, Cheese")
pizza2 = Pizza.create(name: "Pepperoni", ingredients: "Dough, Tomato Sauce, Cheese, Pepperoni")

# Create RestaurantPizzas
RestaurantPizza.create(restaurant: restaurant1, pizza: pizza1, price: 10)
RestaurantPizza.create(restaurant: restaurant1, pizza: pizza2, price: 12)
RestaurantPizza.create(restaurant: restaurant2, pizza: pizza1, price: 8)

puts 'Seed data created successfully!'