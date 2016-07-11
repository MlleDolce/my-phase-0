# House Maker

#Allow the user to create house 
# then add rooms,
# then add items,

# House can have up to 5 rooms
# Room can have an unlimited number of items

# BUSINESS LOGIC
#rooms = Array.new
def parse_room_name(room_name)
	rooms = []
	room_words = room_name.split(' ')
	room_words.each do |word| 
		word.capitalize
		rooms << word.capitalize
	end
	rooms.join(' ')
end

def add_room_to_house!(house, room_name)
	if house.keys.length == 5
		false
	else
		house[room_name] = []
		true
	end
end

def add_item_to_room!(house, room_name, item_name)
	house[room_name] << item_name
end

house = {}

# User INTERFACE

def print_house(house)
	puts "------------------"
	house.keys.each_with_index do |room_name, index|
		puts "#{index} - #{room_name}: #{house[room_name]}"
	end
	puts "------------------"
end

can_add_rooms = true

# Let the user add rooms
# Stop loop when rooms cannot be added
while can_add_rooms
  # Get a room name from the user
  puts "Type the name of a room to add (or type 'done'):"
  room_name = gets.chomp
  # If the user is done, stop loop
  break if room_name == 'done'
  # Otherwise, add the room to the house
  can_add_rooms = add_room_to_house!(house, parse_room_name(room_name))
  if !can_add_rooms
  	puts "Sorry, that's too many rooms!"
  end
  print_house(house)
end

# Let the user add items to rooms
# In an infinite loop:
loop do
	# Ask the user for the number of the room they want to add
	# items to
	puts "Enter the number of the room to add an item to (or type 'done):"
	inputted_idx = gets.chomp
	# IF the user is done, break
	break if inputted_idx == 'done' # <-- this is called a 'sentinel' value
	# Otherwise, add the item to the room
	room_idx = inputted_idx.to_i
	puts "Enter the item to add:"
	item_to_add = gets.chomp
	add_item_to_room!(house, house.keys[room_idx], item_to_add)
	# print the new house configuration
	print_house(house)
end


# TEST CODE

#rooms = ["Living room", "bedroom", "bathroom", "kitchen", "bedroom 2", "bedroom 3"]

#rooms.each do |room|
#	room_added = add_room_to_house!(house, room)
#	add_item_to_room!(house,room, "cat") if room_added
#end


