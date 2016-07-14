# 6.5, Release 2: Mix in a Module

# Sometimes, two classes don't have much in common, but they share behavior. 
# We can use a module to add the same behavior to both classes. 
# For instance, birds and airplanes can both fly.

# 1. In phase-0-tracks/ruby/flight.rb, declare classes for a bird and a plane:
# 2. Now, let's write a Flight module. 
# We'll need to do that above our class declarations, at the top of the file.
# But wait. Where's that self keyword we just learned about? 
# When we're writing a module as a mixin designed to add instance methods to a class, we don't use the self keyword. 
# We can define our module methods the same way we would write instance methods inside of a class.
# 3. Add your module to your Bird and Plane classes:

module Flight
	def take_off(altitude)
		puts "Taking off and ascending until reaching #{altitude}..."
	end
end

class Bird
	include Flight
end

class Plane
	include Flight
end

# 4. Now, instances of our Bird and Plane classes will have the ability to take off. 
# See for yourself by adding this code to the bottom of the file and running it from the command line:

bird = Bird.new
bird.take_off(800)

plane = Plane.new
plane.take_off(30000)