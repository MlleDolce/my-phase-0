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

class Grand_Piano
	attr_reader :make, :model, :kind_of_wood
	attr_accessor :age, :tunes_per_year, :broken_strings, :finish_color,

	def initialize(brand, model)
		@make = brand
		@model = model
		@age = age
		@broken_strings = 0
	end

	def maintenance(integer)
		puts "You have #{@broken_strings} on your #{@make}."
		puts "You tune your piano #{tunes_per_year} times per year"
	end

	def play(song)
		puts "*sings beautifully* You played #{song}"
	end
end





