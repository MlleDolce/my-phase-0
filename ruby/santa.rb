santas = []

class Santa

	def initialize(gender, ethnicity)
		puts "Initializing new Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", 
		"Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type} cookies"
	end

	def about
		puts "Age: #{@age}"
		puts "Gender: #{@gender}"
		puts "Ethnicity: #{@ethnicity}"
	end

	def celebrate_birthday(num_of_birthdays)
		@age += num_of_birthdays
	end

	def get_mad_at(reindeer_name)
		@reindeer_ranking.delete(reindeer_name)
		@reindeer_ranking.push(reindeer_name)
		puts @reindeer_ranking
	end

	def reassign_gender=(new_gender)
		@gender = new_gender
	end

	def age
		@age
	end

	def ethnicity
		@ethnicity
	end
end

genders = ["male", "female", "bi-gender", "N/A", "male-female", "female-male"]
ethnicities = ["white", "korean", "brasilian", "chinese", "black", "hispanic"]

genders.length.times do |index|
	santas << Santa.new(genders[index], ethnicities[index])
end

puts "Testing each Santa instance to learn about each santa..."
santas.each do |santa|
	santa.celebrate_birthday(1)
	santa.about
end

Andrea = Santa.new("female", "white")

p Andrea.get_mad_at("Rudolph")

p Andrea.reassign_gender = "unicorn"
p Andrea.age
p Andrea.ethnicity


