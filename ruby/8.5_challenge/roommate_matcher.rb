require 'sqlite3'
require 'faker'

#tidiness on a scale from 1 to 5, with 5 being extremely tidy
# maximum dollar amount willing to pay

db = SQLite3::Database.new("roommate_matcher.db")
db.results_as_hash = true

create_table1 = <<-SQL
  CREATE TABLE IF NOT EXISTS users_needing_housing (
  	id INTEGER PRIMARY KEY,
  	name VARCHAR(50),
  	email VARCHAR(100),
  	tidiness INT, 
  	nightowl BOOLEAN(5),
  	earlybird BOOLEAN(5),
  	housing_needed BOOLEAN(5),
  	neighborhood VARCHAR(50),
  	price INT 
  	)
SQL

create_table2 = <<-SQL
  CREATE TABLE IF NOT EXISTS users_seeking_roommate (
  	id INTEGER PRIMARY KEY,
  	name VARCHAR(200),
  	email VARCHAR(100),
  	tidiness INT,
  	nightowl BOOLEAN(5),
  	earlybird BOOLEAN(5),
  	vacancy BOOLEAN(5),
  	neighborhood VARCHAR(50),
  	price INT
  	)
SQL

db.execute(create_table1)
db.execute(create_table2)

manhattan_neighborhoods = ['Upper West Side', 'Upper East Side', 'Midtown East', "Hell's Kitchen", "Garment District", "Murray Hill", "Chelsea", "Gramercy Park", 
	"West Village", "Greenwich Village", "East Village", "Soho", "Lower East Side", "Tribeca", "Financial District"]

def create_user_needing_housing(db, name, email, tidiness, nightowl, earlybird, housing_needed, neighborhood, price)
	db.execute("INSERT INTO users_needing_housing (name, email, tidiness, nightowl, earlybird, housing_needed, neighborhood, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [name, email, tidiness, nightowl, earlybird, housing_needed, neighborhood, price])
end

def create_user_seeking_roommate(db, name, email, tidiness, nightowl, earlybird, vacancy, neighborhood, price)
	db.execute("INSERT INTO users_seeking_roommate (name, email, tidiness, nightowl, earlybird, vacancy, neighborhood, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [name, email, tidiness, nightowl, earlybird, vacancy, neighborhood, price])
end

#create_user_needing_housing(db, Faker::Name.name, 2, 'true', 'false', 'true', 1000)
#create_user_seeking_roommate(db, Faker::Name.name, 3, 'false', 'true', 'true', 1200)

300.times do
	create_user_needing_housing(db, Faker::Name.name, Faker::Internet.email, rand(1..3), ['true', 'false'].sample, ['true', 'false'].sample, 'true', manhattan_neighborhoods.sample, (rand(130..210)*10))
end

300.times do
	create_user_seeking_roommate(db, Faker::Name.name, Faker::Internet.email, rand(1..3), ['true', 'false'].sample, ['true', 'false'].sample, 'true', manhattan_neighborhoods.sample, (rand(130..210)*10))
end

puts "Welcome to the Manhattan Roommate Matcher.  What is your full name?"
name = gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Please enter your email address:"
email = gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Hello #{name}!  What is your situation?  Are you (A.) searching for housing, or (B.) looking for a roommate for your dwelling?  Please enter 'A' or 'B'."
housing_status = gets.chomp.to_s

loop until housing_status == "A" || housing_status == "B"
	if housing_status == "A"
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "Which Manhattan neighborhood would you like to live in?  If you have no preference, enter 'no preference'."
	  neighborhood = gets.chomp.to_s
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "What is the maximum rent amount you are willing to pay per month on a room?"
	  price = gets.chomp.to_i
	elsif housing_status == "B"
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "In which Manhattan neighborhood is your home located?"
	  neighborhood = gets.chomp.to_s
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "What is the rent amount you are asking for your room?"
	  price = gets.chomp.to_i
	else
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "That is not a valid input.  Please enter 'A' or 'B'"
	  housing_status = gets.chomp.to_s
end

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "What is your level of tidiness on a scale from 1 to 3.  (3: 'very clean', 2: 'I clean now and then', 1: 'I don't mind a bit of mess')"
puts "Please enter a whole number between 1 and 3."
tidiness = gets.chomp.to_i

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Are you a night owl? (true or false)"
nightowl = gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Are you an early bird? ('true' or 'false')"
earlybird = gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Do you have a preference if your roommate is a night owl or an early bird? ('yes' or 'no')"
sleep_preference = gets.chomp.to_s

puts "Thank you for participating in the Manhattan Roommate Matcher, #{name}.  You have been added to our database of users."  
puts "Calculating your matches..."


if housing_status == "A"
	# Add new user to database:
	create_user_needing_housing(db, name, email, tidiness, nightowl, earlybird, 'true', neighborhood, price)

	# Create variable to represent the hash for ALL data of users seeking a roommate
	housing_data = db.execute("SELECT * FROM users_seeking_roommate")

	# Create an empty array to push each good roommate match to.
	good_matches = []
	housing_data.each do |roommate_seeker|


	all_criteria = (price >= roommate_seeker['price']) && tidiness == roommate_seeker['tidiness'] &&
	    			(nightowl == roommate_seeker['nightowl'] || earlybird == roommate_seeker['earlybird']) &&
	    			neighborhood == roommate_seeker['neighborhood']

	no_neighborhood_pref = (price >= roommate_seeker['price']) && tidiness == roommate_seeker['tidiness'] &&
	    						(nightowl == roommate_seeker['nightowl'] || earlybird == roommate_seeker['earlybird'])

	no_sleep_pref = (price >= roommate_seeker['price']) && tidiness == roommate_seeker['tidiness'] &&
	    			neighborhood == roommate_seeker['neighborhood']

	no_preferences = (price >= roommate_seeker['price']) && tidiness == roommate_seeker['tidiness']

		if (neighborhood == 'no preference' && sleep_preference == 'no' && no_preferences) ||
			(neighborhood == 'no preference' && no_neighborhood_pref) ||
			(sleep_preference == 'no' && no_sleep_pref) || all_criteria
			good_matches.push(roommate_seeker)
		end
	end
else
	# Add new user to database:
	create_user_seeking_roommate(db, name, email, tidiness, nightowl, earlybird, 'true', neighborhood, price)

	# Create variable to represent the hash for ALL data of users seeking a roommate
	housing_data = db.execute("SELECT * FROM users_seeking_roommate")

	# Create an empty array to push each good roommate match to.
	good_matches = []
	housing_data.each do |housing_seeker|

			# Create variable to represent the hash for ALL data of users seeking a roommate
		housing_data = db.execute("SELECT * FROM users_needing_housing")

		all_criteria = (price <= housing_seeker['price']) && tidiness == housing_seeker['tidiness'] &&
		    			(nightowl == housing_seeker['nightowl'] || earlybird == housing_seeker['earlybird']) &&
		    			neighborhood == housing_seeker['neighborhood']

		no_neighborhood_pref = (price <= housing_seeker['price']) && tidiness == housing_seeker['tidiness'] &&
		    						(nightowl == housing_seeker['nightowl'] || earlybird == housing_seeker['earlybird'])

		no_sleep_pref = (price <= housing_seeker['price']) && tidiness == housing_seeker['tidiness'] &&
		    			neighborhood == housing_seeker['neighborhood']

	    no_preferences = (price <= housing_seeker['price']) && tidiness == housing_seeker['tidiness']

		if (neighborhood == 'no preference' && sleep_preference == 'no' && no_preferences) ||
			(neighborhood == 'no preference' && no_neighborhood_pref) ||
			(sleep_preference == 'no' && no_sleep_pref) || all_criteria
			good_matches.push(housing_seeker)
		end
	end
end

if good_matches.length == 0
  puts "I'm sorry.  We have no current users who match your housing needs."  
  puts "Please check in with us again soon, as our client network is rapidly growing.  Goodbye."
else
  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
  puts "Manhattan Roommate Matcher has calculated a total of #{good_matches.length} user matches for you:"
       good_matches.each {|match| puts "#{match['name']} is a match!  email: #{match['email']}"}
  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
  puts "We hope to see you again soon.  Goodbye"
end

