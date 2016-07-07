# pseudo-code and write a program that will allow an interior designer to enter the details of a given client: 
# the client's name, age, number of children, decor theme, and so on.
# You can choose your own as long as it's a good mix of string, integer, and boolean data).
# Your keys should be symbols unless you particularly need a string (when white spaces or 'user friendly' spaces are needed)

# Write the program code to ask client for the given details.

puts "What is your full name?"
name = gets.chomp.to_s

puts "What is your age?"
age = gets.chomp.to_i

puts "How many children do you have?"
num_children = gets.chomp.to_i

puts "What decor theme do you prefer?"
decor_theme = gets.chomp.to_s

puts "Do you like bold color themes? (true/false)"
like_color = gets.chomp.to_s

puts "Do you like minimalist themes? (true/false)"
like_minimalism = gets.chomp.to_s

# convert user input to appropriate data type. 
client_hash = {name: name, age: age, children?: num_children, decor_theme: decor_theme, bold_colors?: like_color, minimalism?: like_minimalism}

#Print the hash back out to the screen when the designer has answered all of the questions.
puts client_hash

#Give the user opportunity to update a key
puts "Would you like to update/change any of your answers before you submit your survey? (y/n)"
update_pref = gets.chomp.to_s

if update_pref == "y"
	puts "Please input the key of the detail you would like to change"
	key = gets.chomp
	key_sym = key.to_sym
	#convert string to symbol
	puts "Please input your updated answer"
	new_answer = gets.chomp.to_s
	client_hash[key_sym] = new_answer
	puts "Key #{key_sym} is now updated.  Here is your updated survey form: #{client_hash}"
else update_pref == "no"
	"Ok, thank you for completing our survey!"
end

