#Create a program that asks the user for the following data about hamsters
# Hamster's name
# Volume level from 1 to 10
#fur color
#whether hamster is good candidate for adoption
#estimated age

puts "What is the hamster's id/name?"
hamster_name = gets.chomp.to_s
puts "What is the hamster's volume level from 1 to 10"
volume = gets.chomp.to_i
if volume > 10 || volume < 1
	puts "That is an invalid number.  Enter a number between 1 and 10." 
end
puts "What is the hamster's fur color?"
fur_color = gets.chomp.to_s
puts "Is the hamster a good candidate for adoption? (y/n)"
adoptable = gets.chomp
if adoptable != "y" || "n"
	puts "That is an invalid response.  Answer with 'y' or 'n'"
end
puts "What is the hamster's estimated age in months?"
hamster_age = gets.chomp.to_f
if hamster_age.nil? == true
	hamster_age = nil
end

puts "Your hamster's id/name is #{hamster_name}"
puts "Your hamster's volume is #{volume}"
puts "Your hamster's fur color is #{fur_color}"
puts "Is the hamster adoptable? #{adoptable}"
puts "The hamster's estimated age is #{hamster_age} months old"