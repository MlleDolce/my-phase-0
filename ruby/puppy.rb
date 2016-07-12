class Puppy

	def initialize
		puts "Initializing new puppy instance..."
	end

	def fetch(toy)
		puts "I brought back the #{toy}!"
		p toy
	end

	def speak(integer)
		puts "Woof!" * integer
	end

	def roll_over
		puts "*rolls over*"
	end

	def dog_years(integer)
		human_years = integer
		p "Your dog is #{human_years * 7} years old in dog years"
	end

	def high_five
		puts "*high five*"
	end
end

class Kitten

	def initialize
		puts "Initializing new kitten instance..."
	end

	def speak(integer)
		puts "Meow" * integer
	end

	def scratch(furniture)
		puts "*scratches #{furniture}*"
	end
end

remy = Puppy.new

remy.fetch("ball")
remy.speak(3)
remy.roll_over
remy.dog_years(4)
remy.high_five

kittens = []

i = 0
until i > 50
	unnamed_kitten = Kitten.new
	kittens << unnamed_kitten
	i += 1
end

kittens.each do |kitten| 
	kitten.speak(2)
	kitten.scratch("sofa")
end

p kittens

=begin
Species ----------------
Puppies (Canis lupus familiaris)

Characteristics -------
size: small
friendly: yes
legs: 4
furry: yes

Behavior ---------------
Play
Lick
Sleep
=end