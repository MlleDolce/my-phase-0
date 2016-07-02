#Create a program that asks the user for the following data about hamsters
# Hamster's name
# Volume level from 1 to 10
#fur color
#whether hamster is good candidate for adoption
#estimated age

puts "What is the hamster's id/name?"
hamster_name = gets.chomp
puts "What is the hamster's volume level from 1 to 10"
volume = gets.chomp.to_i
if volume > 10 || volume < 1
	puts "That is an invalid number.  Enter a number between 1 and 10." 
end
puts "What is the hamster's fur color?"
fur_color = gets.chomp
puts "Is the hamster a good candidate for adoption? (y/n)"
adoptable = gets.chomp
puts "What is the hamster's estimated age?"
hamster_age = gets.chomp.to_i