# Release 0: Bring Santa to life

# Eventually, your simulator will build thousands of Santas, 
# but for now, start by defining a Santa class in phase-0-tracks/ruby/santa.rb. 
# Your class should have three instance methods:
# => A speak method that will print "Ho, ho, ho! Haaaappy holidays!" (Santa has been working on being more inclusive.)
# => An eat_milk_and_cookies method that takes a cookie type (example: "snickerdoodle") as a parameter and prints "That was a good <type of cookie here>!" 
# => An initialize method that prints "Initializing Santa instance ...".
# Add a bit of code below your class declaration to check that you're able to initialize a Santa instance 
# and call its methods.


# Release 1: Give Santa Attributes for Christmas
# Update your Santa class with the following attributes:
# gender, which will be a string passed in on initialization
# ethnicity, which will be a string passed in on initialization
# reindeer_ranking, an array of reindeer from most preferred to least preferred. 
# This is not passed in on initialization; it simply gets a default value of 
# ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
# age, which is not passed in on initialization and defaults to 0

santas = []

class Santa
	attr_reader :ethnicity
	attr_accessor :gender, :age

	def initialize(gender, ethnicity)
		puts "Initializing new Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", 
		"Cupid", "Donner", "Blitzen"]
		@age = rand(0..140)
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

	def age_generator
		ages = []
		year = 0
		until ages.length == 141
			ages << year
			year += 1
		end
		p ages.sample
	end
end

genders = ["male", "female", "bi-gender", "N/A", "male-female", "female-male", "genderless"]
ethnicities = ["white", "korean", "brasilian", "chinese", "black", 
	"hispanic", "first nations", "japanese"]


#Release 1, driver code: 

genders.length.times do |index|
	santas << Santa.new(genders[index], ethnicities[index])
end

puts "Testing each Santa instance to learn about each santa..."
	santas.each do |santa|
	santa.celebrate_birthday(1)
	santa.about
end


# Release 2: Change an Attribute with a Method

# Add three attribute-changing methods to your Santa class:
	# celebrate_birthday should age Santa by one year.
	# get_mad_at can take a reindeer's name as an argument, and move that reindeer in last place in the reindeer rankings. Vixen knows what he did.
	# The @gender attribute should have a setter method that allows @gender to be reassigned from outside the class definition.
	# Add two "getter" methods as well:
# The method age should simply return @age.
# The method ethnicity should return @ethnicity.
# Update your driver code to test your work.

Andrea = Santa.new("female", "white")
p Andrea.get_mad_at("Rudolph")
p Andrea.gender = "unicorn"
p Andrea.age = 30
p Andrea.ethnicity

# Release 3: Refactor with attr_reader and attr_accessor.  Verify that your driver code still works.

# Release 4: Build Many, Many Santas

# Use our array of example genders and an array of example ethnicities. RANDOMIZE 
# Set your new Santa's age to a random number between 0 and 140.
# No need to store your Santas in a data structure, but your program should print out 
# the attributes of each Santa using the instance methods that give you access to that data.

until santas.length == 50
	santas << Santa.new(genders.sample, ethnicities.sample)
end

#Version 1, with age_generator 

=begin
santas.each do |santa| 
	santa.age = santa.age_generator
	p santas.index(santa)
	p santa.gender
	p santa.ethnicity
end
=end

#Version 2, simplified age_generator with age = rand(0..140)
santas.each do |santa| 
	puts "Santa_no.#{santas.index(santa)}, Gender: #{santa.gender}, Age:#{santa.age}, Ethnicity: #{santa.ethnicity}"
end


