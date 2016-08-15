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
  	gender VARCHAR(6),
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
  	gender VARCHAR(6),
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

def create_user_needing_housing(db, name, gender, email, tidiness, nightowl, earlybird, housing_needed, neighborhood, price)
	db.execute("INSERT INTO users_needing_housing (name, gender, email, tidiness, nightowl, earlybird, housing_needed, neighborhood, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [name, gender, email, tidiness, nightowl, earlybird, housing_needed, neighborhood, price])
end

def create_user_seeking_roommate(db, name, gender, email, tidiness, nightowl, earlybird, vacancy, neighborhood, price)
	db.execute("INSERT INTO users_seeking_roommate (name, gender, email, tidiness, nightowl, earlybird, vacancy, neighborhood, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [name, gender, email, tidiness, nightowl, earlybird, vacancy, neighborhood, price])
end

#create_user_needing_housing(db, Faker::Name.name, 2, 'true', 'false', 'true', 1000)
#create_user_seeking_roommate(db, Faker::Name.name, 3, 'false', 'true', 'true', 1200)

1.times do
	create_user_needing_housing(db, Faker::Name.name, ['male','female'].sample, Faker::Internet.email, rand(1..3), ['true', 'false'].sample, ['true', 'false'].sample, 'true', manhattan_neighborhoods.sample, (rand(130..210)*10))
end

1.times do
	create_user_seeking_roommate(db, Faker::Name.name, ['male','female'].sample, Faker::Internet.email, rand(1..3), ['true', 'false'].sample, ['true', 'false'].sample, 'true', manhattan_neighborhoods.sample, (rand(130..210)*10))
end

puts "Welcome to the Manhattan Roommate Matcher.  Let's get started."

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Please enter your email address:"
email = "a@hotmail.com" #gets.chomp.to_s

puts "What is your full name?"
name = "AKC" #gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "What is your gender? ('male' or 'female')"
gender = 'female' #gets.chomp.to_s
gender = 'other' if !(gender == 'male') && !(gender == 'female')

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Do you prefer your roommate to be the same gender? ('yes' or 'no preference')"
gender_pref = 'no' #gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Hello #{name}!  What is your situation?  Are you (A.) searching for housing, or (B.) looking for a roommate for your dwelling?  Please enter 'A' or 'B'."
housing_status = 'B' #gets.chomp.to_s

loop until housing_status == "A" || housing_status == "B"
	if housing_status == "A"
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "Which Manhattan neighborhood would you like to live in?  If you have no preference, enter 'no preference'."
	  neighborhood = 'Garment District' #gets.chomp.to_s
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "What is the maximum rent amount you are willing to pay per month on a room?"
	  price = 2100 #gets.chomp.to_i
	elsif housing_status == "B"
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "In which Manhattan neighborhood is your home located?"
	  neighborhood = 'Lower East Side' #gets.chomp.to_s
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "What is the rent amount you are asking for your room?"
	  price = 2100 #gets.chomp.to_i
	else
	  puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	  puts "That is not a valid input.  Please enter 'A' or 'B'"
	  #housing_status = gets.chomp.to_s
end

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "What is your level of tidiness on a scale from 1 to 3.  (3: 'very clean', 2: 'I clean now and then', 1: 'I don't mind a bit of mess')"
puts "Please enter a whole number between 1 and 3."
tidiness = 2 #gets.chomp.to_i

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Are you a night owl? (true or false)"
nightowl = 'true' #gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Are you an early bird? ('true' or 'false')"
earlybird = 'false' #gets.chomp.to_s

puts "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
puts "Do you have a preference if your roommate is a night owl or an early bird? ('yes' or 'no')"
sleep_preference = 'no' #gets.chomp.to_s

puts "Thank you for participating in the Manhattan Roommate Matcher, #{name}.  You have been added to our database of users."  
puts "Calculating your matches..."


if housing_status == "A"
	# Add new user to database:
	create_user_needing_housing(db, name, gender, email, tidiness, nightowl, earlybird, 'true', neighborhood, price)

	# Create variable to represent the hash for ALL data of users seeking a roommate
	housing_data = db.execute("SELECT * FROM users_seeking_roommate")

	# Create an empty array to push each good roommate match to.
	good_matches = []
	housing_data.each do |roommate_seeker|
		rs = roommate_seeker
		# Create variables for each possible combinations of user preferences:
		all_criteria = (price >= rs['price']) && tidiness == rs['tidiness'] &&
		    			(nightowl == rs['nightowl'] || earlybird == rs['earlybird']) &&
		    			neighborhood == rs['neighborhood'] &&
		    			gender == rs['gender']

		gender_only = (price >= rs['price']) && tidiness == rs['tidiness'] &&
						gender == rs['gender']

		neighborhood_only = (price >= rs['price']) && tidiness == rs['tidiness'] &&
							neighborhood == rs['neighborhood']

		sleep_only = (price >= rs['price']) && tidiness == rs['tidiness'] &&
					(nightowl == rs['nightowl'] || earlybird == rs['earlybird'])

		no_gender_pref = (price >= rs['price']) && tidiness == rs['tidiness'] &&
		    			(nightowl == rs['nightowl'] || earlybird == rs['earlybird']) &&
		    			neighborhood == rs['neighborhood']

		no_neighborhood_pref = (price >= rs['price']) && tidiness == rs['tidiness'] &&
		    						(nightowl == rs['nightowl'] || earlybird == rs['earlybird']) &&
		    						gender == rs['gender']

		no_sleep_pref = (price >= rs['price']) && tidiness == rs['tidiness'] &&
		    			neighborhood == rs['neighborhood'] &&
		    			gender == rs['gender']

		no_preferences = (price >= rs['price']) && tidiness == rs['tidiness']

		if (gender_pref == 'no preference' && sleep_preference == 'no' && neighborhood == 'no preference' && no_preferences) ||
			((gender_pref == 'yes') && (sleep_preference == 'no') && neighborhood == 'no preference' && gender_only) || 
			( !(neighborhood == 'no preference') && neighborhood_only && sleep_preference == 'no' && gender_pref == 'no preference') ||
			(sleep_preference == 'yes' && sleep_only && gender_pref == 'no preference' && neighborhood == 'no preference') ||
			(gender_pref == 'no preference' && no_gender_pref) ||
			(neighborhood == 'no preference' && no_neighborhood_pref) ||
			(sleep_preference == 'no' && no_sleep_pref) || all_criteria
			good_matches.push(roommate_seeker)
		end
	end
else
	# Add new user to database:
	create_user_seeking_roommate(db, name, gender, email, tidiness, nightowl, earlybird, 'true', neighborhood, price)

	# Create variable to represent the hash for ALL data of users seeking a roommate
	housing_data = db.execute("SELECT * FROM users_seeking_roommate")

	# Create an empty array to push each good roommate match to.
	good_matches = []
	housing_data.each do |housing_seeker|
		hs = housing_seeker


		gender_only = (price <= hs['price']) && tidiness == hs['tidiness'] &&
						gender == hs['gender']

		sleep_only = (price <= hs['price']) && tidiness == hs['tidiness'] &&
					(nightowl == hs['nightowl'] || earlybird == hs['earlybird'])


		no_neighborhood_pref = (price <= hs['price']) && tidiness == hs['tidiness'] &&
		    						(nightowl == hs['nightowl'] || earlybird == hs['earlybird']) &&
		    						gender == hs['gender']

		no_preferences = (price <= hs['price']) && tidiness == hs['tidiness']

		if (gender_pref == 'no preference' && sleep_preference == 'no' && no_preferences) ||
			((gender_pref == 'yes' && gender_only) && (sleep_preference == 'no')) ||
			((gender_pref == 'no preference') && sleep_only) ||
			no_neighborhood_pref # includes all criteria for roommate_seekers
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
  puts good_matches
  puts "We hope to see you again soon.  Goodbye"
end

# Add columns for user's: gender ---> 3.5 hrs
# Combine nightowl and earlybird columns into a 'work schedule' column.  Add 'intermediate' option
# Write if statement for 'preferences'
# set price ranges/limits for each neighborhood 
# Add more NYC neighborhoods.  Brooklyn & Queens too.  

# Add more user interactions with database:
# => allow queries for each category (table column): neighborhood, tidiness, etc
# Sort all matches in increasing order of compatibility?
# Add if statements to the final print statement to allow the statement to print/restate the user's preferences, reflected in their database entry

# set up a database interaction for ADMIN.  Preference columns from user feedback should be added to each table. 
#  ADMIN interaction should allow queries to match multiple users according to the preferences settings entered


