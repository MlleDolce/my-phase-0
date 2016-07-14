# 6.5: Release 1: Write a Simple Module

# 1. Declare your module:
# 2.  In your terminal, run IRB from the directory that contains shout.rb. 
# We can use require_relative to load our new module:
# => require_relative 'shout'
# => Shout.singleton_methods
# We've loaded the module, but it doesn't have any methods yet. That makes sense -- we haven't written any!
# 3. Exit IRB and add this method for yelling angrily:

# 4. Add a yelling_happily method to our module. 
#  You can decide what that method should return
# 5. Add driver code underneath your module declaration that calls both of your module methods. 
# If you aren't sure what will work, you can experiment in IRB first by 
# requiring your file and then trying out some method calls. 

# Release 3: Convert a standalone Module to a Mixin

# It seems as though the Shout module would make more sense as a mixin module instead of a standalone module.
# 1.  Comment out the old code in shout.rb, and make a mixin version of the Shout module instead.
# 2. Write two classes representing anything that might shout, and include the Shout module in those classes.
# 3. Test your work by adding driver code at the bottom of the file that instantiates instances 
#   of your classes and calls the two module methods on each instance.

module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end
	def yell_happily(words)
		words + "!" + " :D"
	end
end

# Write two classes of anything that might shout:
class Human
	include Shout
end

class Angry_robot
	include Shout
end

# Driver Code
tall_man = Human.new
p tall_man.yell_angrily("Go away")
p tall_man.yell_happily("Oh, happy day")

c3p0 = Angry_robot.new
p c3p0.yell_angrily("We're doomed")
p c3p0.yell_happily("R2D2, we did it.  Hooray")


=begin #old code:
module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yell_happily(words)
		words + "!" + " :D"
	end
end
=end


# Driver Code, Release 1
# p Shout.yell_angrily("Yo Mr.!  Why did you cut me off?")
# p Shout.yell_happily("Today was so great")