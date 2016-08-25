# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Release 0: 
# 1.  Update the code with a /contact route that displays an address
get '/contact/:address' do
  address = params[:address]
  "Plese send all inquiries to: #{address}"
end

# 2.  Add a /great_job route that can take a person's name as a query parameter (not a route parameter) 
# and say "Good job, [person's name]!". If the query parameter is not present, 
# the route simply says "Good job!"

get '/great_job/' do
  if params[:name]
    "Good job, #{params[:name]}!"
  else
    "Good job!"
  end
end

# 3.  Add a route that uses route parameters to add two numbers and respond with the result. 
# The data types are tricky here -- when will the data need to be (or arrive as) a string?
get '/add_numbers/:number_1/plus/:number_2' do
  number_1 = params[:number_1].to_i
  number_2 = params[:number_2].to_i
  result = number_1 + number_2
  "Let's add your two numbers together!<br><br> #{number_1} plus #{number_2} is:<br><br> (*drum roll*) <br><br>#{result}"
end

# 4.  Optional bonus: Make a route that allows the user to search the database in some way -- 
# maybe for students who have a certain first name, or some other attribute. 
# If you like, you can simply modify the home page to take a query parameter, 
# and filter the students displayed if a query parameter is present.

get '/search/:age_under' do
  age_under = params[:age_under].to_i
  students = db.execute("SELECT * FROM students")
  response = "The following students are under the age of #{age_under}: <br><br>"
  students.each do |student|
    if student['age'].to_i < age_under
      response << "ID: #{student['id']}<br>"
      response << "Name: #{student['name']}<br>"
      response << "Age: #{student['age']}<br>"
      response << "Campus: #{student['campus']}<br><br>"
    end
  end
  if age_under < 18
      "The minimum age of a student is 18.  Try again"
  elsif age_under >= 18
      response
  else
      "That is an invalid entry.  Try again"
  end
end

# Release 1: Research

# 1.  Is Sinatra the only web app library in Ruby? What are some others?
#    No.  Some others are: Ruby on Rails, Merb, Nitro, and Camping.  Sinatra excels at creating simple applications.

#    Unlike Ruby on Rails, Sinatra only has the basics of ones needs for a web applications.  Although simple,
#    it is very elegant and powerful.

# 2.  Are SQLite and the sqlite3 gem your only options for using a database with Sinatra? What are some others?
# => MySQL and PostGreSQL are two common alternatives.  MySQL is the most popular.  PostGreSQL is the most advanced.
# => SQLite is beginner-friendly and the easiest way to get started on Ruby on Rails.  As a more serious user,
# => SQLite has too many limitations to be an ideal option for production

# 3.  What is meant by the term web stack?
# => A web stack is a collection of software required for Web development.  A web stack always includes:
# =>  --- an OS
# =>  ----a programming language
# =>  ----database software, and a
# => -----web server
