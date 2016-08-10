
# 5.4 Release 1, Question 1: 
# A method that iterates through the items, deleting any that meet a certain condition 
# (for example, deleting any numbers that are less than 5).
int1_array = [1, 2, 3, 4, 5, 6]
fruit_hash = {bananas: 5, mangos: 3, strawberries: 7, apples: 2, watermelon: 1}

puts "Before .delete_if:"
p int1_array
p fruit_hash

int1_array.delete_if { |int| int < 5}
fruit_hash.delete_if {|fruit, num| num >= 3 }

puts "After .delete_if:"
p int1_array
p fruit_hash

# 5.4 Release 1, Question 2:
# A method that filters a data structure for only items that do satisfy a certain condition 
# (for example, keeping any numbers that are less than 5).
int2_array = [3, 4, 5, 6, 7]
fruit2_hash = {"dragonfruit" => 1, "passionfruit" => 2, "pineapple" => 9}

puts "Before .delete_if:"
p int2_array
p fruit2_hash

int2_array.keep_if { |int| int < 5 }
fruit2_hash.keep_if { |fruit, num| num >= 9 }

puts "After .delete_if:"
p int2_array
p fruit2_hash

# 5.4 Release 1, Question 3:
# A different method that filters a data structure for only items satisfying a certain condition 
# -- Ruby offers several options
int3_array = [100, 200, 300]
fruit3_hash = {"orange" => 2, "grapes" => 20, "grapefruit" => 1}

puts "Before array method .drop_while"
p int3_array

puts "using array method .drop_while"
p int3_array.drop_while {|int| int < 300 }

puts "Before .values_at:"
p fruit3_hash

puts "after .values_at:"
p fruit3_hash.values_at("orange", "grapes")


# 5.4 Release 0

family_pets = ["Remy", "Molly", "Toklat", "Spicy", "Ramen"]

my_hash = {Vancouver: "Canucks", Edmonton: "Oilers", Toronto: "Maple Leafs", Montreal: "Canadienes" }

puts "Original data"
p family_pets
p my_hash

family_pets.each do |pet|
	puts "The name of a pet is #{pet}"
end

family_pets.map! do |pet|
	puts pet
	pet + "awesome"
end

my_hash.each do |city, team|
	puts "The city #{city} has the team #{team}"
end

puts "After .map call"
p family_pets
p my_hash


## 5.0

def grocery_list
	item1 = "bananas"
	item2 = "peanut butter"
	puts "Hello there!"
	yield(item1, item2)
end

# grocery_list { |item1, item2| puts "please add #{item1} and #{item2} to the grocery list." }