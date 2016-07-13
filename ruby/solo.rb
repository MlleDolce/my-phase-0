# Release 0: Design a Class

# Design (as opposed to actually building) a class representing anything you like. 
# (Please make it something we have at least heard of.) 
# Whether you want to build a fire-breathing dragon, a dress, or a soccer ball, 
# we hereby grant you the freedom to implement it. No matter what you design, your class must have:
# => at least three attributes (using at least two data types) whose values will vary from instance to instance (example: age)
# => at least three methods, at least one of which takes an argument
# => You're welcome to creative about these: a dress can have a swish method, a soccer ball can have an inflatedness attribute, and ... we hope it's obvious what a fire-breathing dragon can do, but if not, you'll figure it out.

# Pseudocode your design as comments in phase-0-tracks/ruby/solo.rb.

# 1. create reader and accessor attributes for class Grand_Piano
# 2. create initializer method to include main attributes: make, model and age
# 3. create two more methods: maintenance and play


# Release 1: Write Your Class

# In the same file as your design, implement your class. 
# Your class should ...
# => Use attr_reader and attr_accessor
# => Use an initialize method that sets at least one attribute

# Release 2: Use Your Class in a Program

# Modify your program so that it has a user interface (a user can interact with your program via the command line).
# => Your user should be allowed to create as many instances of your class as they like.
# => Prompt the user for each attribute, and don't forget to convert their input to the appropriate data type. 
#     Store these class instances in an array.
# => When the user indicates that they are finished creating instances, loop through the array 
#     and print out the attributes of each instance as a confirmation message of what was created.

class Grand_Piano
	attr_reader :make, :model, :kind_of_wood, :year
	attr_accessor :broken_strings, :tunes_per_year

	def initialize(brand, model, year, wood)
		puts "Initializing new Grand_Piano instance...."
		@make = brand
		@model = model
		@year = year
		@kind_of_wood = wood
		@broken_strings = 0
		@tunes_per_year = 0
	end

	def maintenance(num_broken_strings, tunes_per_year)
		puts "You have #{num_broken_strings} broken string on your #{@make}."
			if num_broken_strings > 0
				puts "You should get that taken care of soon."
			else
				puts "Congratulations.  Your piano is in tip top shape"
			end
		puts "You tune your piano #{tunes_per_year} times per year"
		@broken_strings = num_broken_strings
		@tunes_per_year = tunes_per_year
	end

	def play(song)
		puts "*sings beautifully* You played #{song}"
	end
end

cleopatra = Grand_Piano.new("Steinway", "L", 1927, "walnut")

cleopatra.maintenance(1, 2)
p "Your Grand piano is of Make: #{cleopatra.make}, Model: #{cleopatra.model}, Year: #{cleopatra.year}, kind_of_wood: #{cleopatra.kind_of_wood}"












