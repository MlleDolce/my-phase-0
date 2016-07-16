# GPS 2.2 Ruby
# Create a Grocery List
# 07/15/16 11:02pm

# Release 1: Pseudo-code

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Define method with name that takes a single argument of a string.  Name it grocery_string
  # set default quantity: 0.  
  # => split the grocery_string up into individual words that make up an array
  # => make an empty hash
  # => create a key for each item in the array and create a default value of 0. the key is the item, the value is the quantity of items
  # print the list to the console [can you use one of your other methods here?] use puts or p
# output: hash

# Method to add an item to a list
# input: item name and optional quantity
# steps: create method add_item that takes two arguments (see input).  The list is the hash created from the first step.
# output: hash + item

# Method to remove an item from the list
# input: item
# steps: create a method that accepts a single argument: item.  Write code for removing item in method  
# output: hash - item

# Method to update the quantity of an item
# input: item name and item quantity
# steps: create method update_quantity that takes item name as input
# output: new value for key (input) = quantity of item

# Method to print a list and make it look pretty
# input: Grocery list
# steps: Iterate through Grocery list and for each item print "You need (insert item variable), quantity: (insert quantity variable)".  
# output: prints the list in a readable format

# Release 2: Initial Solution

# Using your pseudocode, create your initial solution. 
# If you've spent the time to write your pseudocode in enough detail, this should be relatively easy.
# Remember, your initial solution should not include any special Ruby methods
# Keep the logic basic so you can incorporate fun methods when you refactor!

Grocery_list = {}

def create_list(grocery_string)
grocery_array = grocery_string.split(' ')

grocery_array.each { |item| Grocery_list[item] = 0}
p Grocery_list
end

def add_item(item, quantity = 0)
	Grocery_list[item] = quantity
	p Grocery_list
end

def remove_item(item)
	Grocery_list.delete(item)
	p Grocery_list
end

def update_quantity(item, quantity)
	Grocery_list[item] = quantity
	p Grocery_list
end

def print_list
	Grocery_list.each {|item, quantity| puts "You need #{item}, quantity: #{quantity}"}
end

# Release 3: Test your Solution

# Make sure your code works as you expect. Using your initial solution:

# Create a new list
# Add the following items to your list
#Lemonade, qty: 2
#Tomatoes, qty: 3
#Onions, qty: 1
#Ice Cream, qty: 4
#Remove the Lemonade from your list
#Update the Ice Cream quantity to 1
#Print out your list (Is this readable and nice looking)?

create_list("milk eggs")
add_item("Lemonade", 2)
add_item("Tomatoes", 3)
add_item("Onions", 1)
add_item("Ice Cream", 4)
remove_item("Lemonade")
update_quantity("Ice Cream", 1)
print_list


