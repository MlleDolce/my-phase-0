# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.


# Release 1: Explain what the program is doing:
# The program my_solution.rb creates a class called VirusPredictor, which contains three methods that make up the class.
# The program allows for driver code to be written that creates new instances of VirusPredictor based on location.  Each instance accepts 
# 3 parameters: state_of_origin, population_density, and population.  In the driver code,
# a user can choose between the three class methods (virus_effect, predicted_deaths, and
# speed_of_spread) to implement with their new class instances that they create.

# Release 2: EXPLANATION OF require_relative
#inputs the data from state_data.rb so that my_solution.rb can run.  Without state_data.rb, my_solution.rb will not work.
#
require_relative 'state_data'

class VirusPredictor

# initialize will run every time a new class instance is created, whether or not one of the classes methods
# is invoked
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

# virus_effects method will call and return the output of the methods predicted_deaths and speed_of_spread

  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

# the method predicted_deaths will take the values of population_density and population as well as a state and print
# the predicted number of deaths of people in this particular state due to the virus.  The method will print the
# number of deaths taken from the if/elsif statement.
  def predicted_deaths
    # predicted deaths is solely based on population density
    # Release 8: Refactor:
    number_of_deaths = (@population * @population_density/500).floor
    if @population_density < 50
      number_of_deaths = (@population * 0.05).floor
    end 

    #redundant code, replaced with formula above (release 8):
    #if @population_density >= 200
    #  number_of_deaths = (@population * 0.4).floor
    #elsif @population_density >= 150
    #  number_of_deaths = (@population * 0.3).floor
    #elsif @population_density >= 100
    #  number_of_deaths = (@population * 0.2).floor
    #elsif @population_density >= 50
    #  number_of_deaths = (@population * 0.1).floor
    #else
    #  number_of_deaths = (@population * 0.05).floor
    #end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# the method speed_of_spread will predict how quickly the virus will spread based on the input parameters
# population_density and state. It will then print out the speed of spread as the method's output.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0
    increment_of_50 = (@population_density.to_i / 50) - 50

    if @population_density < 50
      speed += 2.5
    elsif @population_density < 200
      speed = 2.5 - (0.5 * increment_of_50)
    else
      speed += 0.5
    end

    #if @population_density >= 200
    #  speed += 0.5
    #elsif @population_density >= 150
    #  speed += 1
    #elsif @population_density >= 100
    #  speed += 1.5
    #elsif @population_density >= 50
    #  speed += 2
    #else
    #  speed += 2.5
    #end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end


#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

# Release 5: (07.25.16, 11:30pm) Create a report for all 50 states in a DRY way. Does this belong inside the class or outside of it? Why?
## It belongs outside of the class because we are creating new instances of the class VirusPredictor.
### create an array to hold all of the STATE_DATA keys:
data_keys = STATE_DATA.keys
data_keys.each do |state|
  state = VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population])
  state.virus_effects
end

# Release 6: Refactor virus_effects
# First, ONLY look at the virus_effects method. 
# (Do not look at predicted_deaths or speed_of_spread themselves.) It's a short but deceptive method that isn't quite DRY. 
# Consider the scope of instance variables to determine what could be refactored. 
#Once you figure out what the issue is, you'll need to edit the predicted_deaths and speed_of_spread methods.

# Ans: speed_of_spread and predicted_deaths both do not need to take any parameters since the variables are global.  These instance variables are already
#     accessible (@)

# Release 7: Private
# What is the purpose of "private"? What happens if you move it above virus_effects? 
# When would you want to use this method?

# Ans: "private" makes any methods below the statement private.  If you move it above virus_effects, virus_effects is
# no longer accessible through driver code.  You might want to use this code to prevent individual methods from being used,
# but by grouping them together in a public container method (eg: virus_effects), it becomes accessible.

# Release 8: Refactor
# Refactor the private methods predicted_deaths and speed_of_spread. How can you make them more DRY?
# As an FYI, it's probably not the best decision to combine these methods even though they are similar 
# because they are responsible for different things. 
# If the way to calculate either of these changed and you had combined them, they would be much more difficult to separate.

# ANS: Removed the redundancies in the if/elsif statements by establishing a formula to calculate 
# the desired variable in each method.

#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
# => the 'outer' hash uses a hash rocket to link the key (which is a string) to the value, which is another hash.
# => the 'inner' hash (the value of the outer hash) uses the symbol method to link the key with a value.

# What does require_relative do? How is it different from require?
# => => from Ruby API:
      # Require_relative complements the builtin method require by allowing you to load a file that is relative 
      # to the file containing the require_relative statement.

      # When you use require to load a file, you are usually accessing functionality that has been properly installed, 
      # and made accessible, in your system. require does not offer a good solution for loading files within the project’s code. 
      # This may be useful during a development phase, for accessing test data, 
      # or even for accessing files that are "locked" away inside a project, not intended for outside use.

# What are some ways to iterate through a hash?
      # => your_hash.each { |key,value| put code here} , or use your_hash.map

# When refactoring virus_effects, what stood out to you about the variables, if anything?
      # => The variables within the method parameters were redundant.  This is because they are already factored into
      #     each new instance of the class VirusPredictor, so we don't need to ask for these same values every time.

# What concept did you most solidify in this challenge?
      # How to access the name of a key in a hash, by creating an array just for the hash keys.  Eg:  my_hash.keys
