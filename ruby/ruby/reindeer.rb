class Reindeer
  attr_reader :location
  attr_accessor :name

  def initialize(name)
    @name = name
    @location = "the North Pole"
  end

  def take_off(altitude)
    puts "#{@name} took off."
    puts "#{@name} ascended to #{altitude} feet."
  end

  def land(location)
    puts "#{@name} landed safely in #{location}."
    @location = location
  end
end

reindeer = Reindeer.new("Dasher")
puts "#{reindeer.name} is in #{reindeer.location}."
reindeer.take_off(3000)
reindeer.land("Cape Town")
reindeer.name = "The Reindeer Formerly Known as Dasher"
puts "#{reindeer.name} is in #{reindeer.location}."
